import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokidex/component/my_appbar.dart';
import 'package:pokidex/component/my_cards.dart';
import 'package:pokidex/pages/pokemonDetail_page.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => PokemonListPageState();
}

class PokemonListPageState extends State<PokemonListPage> {
  List<Map<String, dynamic>> pokemon = [];
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

      final response = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=20'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List results = data['results'];

        List<Map<String, dynamic>> loadedPokemon = [];

        for (int i = 0; i < results.length; i++) {
          final name = results[i]['name'];
          final id = i + 1;
          final imageUrl =
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

          loadedPokemon.add({'name': name, 'image': imageUrl, 'id': id});
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
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PokemonDetailPage()),
              );
            },
            child: MyCards(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    poke['image'],
                    height: 100,
                    width: 100,
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const SizedBox(
                        height: 100,
                        width: 100,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.image_not_supported,
                          size: 50,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  Text(
                    poke['name'].toString().toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '#${poke['id']}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        },
      );

  }
}
