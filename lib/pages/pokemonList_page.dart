import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokidex/component/my_appbar.dart';
import 'package:pokidex/component/my_cards.dart';
import 'package:pokidex/pages/pokemonDetail_page.dart';

import '../models/pokemon_model.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => PokemonListPageState();
}

class PokemonListPageState extends State<PokemonListPage> {
  List<Map<String, dynamic>> pokemon = [];
  final _pokemon = Pokemon(name: '', image: '', height:0, weight: 0, types:'', abilities:'');
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchPokemonList();
  }

  Future<void> fetchPokemonList() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      //API service
      final response = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=20'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List results = data['results'];



        List<Map<String, dynamic>> loadedPokemon = [];

        for (int i = 0; i < results.length; i++) {
          final name = results[i]['name'];
          final detailUrl = results[i]['url']; // This extracts all details form the url


          final detailResponse = await http.get(Uri.parse(detailUrl));
          if (detailResponse.statusCode == 200) {
            final pokemonDetails = jsonDecode(detailResponse.body);



            final id = pokemonDetails['id'];
            final image =
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/${id}.svg';
            final height = pokemonDetails['height'];
            final weight = pokemonDetails['weight'];
            final types = (pokemonDetails['types']as List)
                .map((type)=> type['type']['name'] as String).join(', '); // Array of type objects
            final abilities = (pokemonDetails['abilities']as List)
                .map((ability)=> ability['ability']['name']).join(', '); // Array of abilities
            final stats = pokemonDetails['stats']; // HP, Attack, Defense, etc.
            final sprites = pokemonDetails['sprites']; // Various image URLs

            loadedPokemon.add({
              'name': name,
              'image': image,
              'id': id,
              'height': height,
              'weight':weight,
              'types': types,
              'abilities':abilities,
              'stats':stats,

            });
          }



        }

        setState(() {
          pokemon = loadedPokemon;
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load Pokemon: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: "Pokemon List"),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              errorMessage!,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: fetchPokemonList,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (pokemon.isEmpty) {
      return const Center(child: Text('No Pokemon found'));
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: pokemon.length,
      itemBuilder: (context, index) {
        final poke = pokemon[index];

        //Using Custom Cards to display Pokemon
        return MyCards(
          image: poke['image'],
          name: poke['name'],
          id: poke['id'],
          types: poke['types'],
          abilities: poke['abilities'],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PokemonDetailPage(
                  pokemon: Pokemon(
                      name: poke['name'],
                      image: poke['image'],
                      height: poke['height'],
                      weight: poke['weight'],
                      types: poke['types'],
                      abilities: poke['abilities'],
                  ),

                ),
              ),
            );
          },
        );
      },
    );
  }
}
