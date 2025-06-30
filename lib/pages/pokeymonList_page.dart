import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PokemonListPage extends StatefulWidget {
  List<Map<String, dynamic>> pokemon = [];

  PokemonListPage({super.key, required this.pokemon});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();

  Future<void> fetchPokemonList() async {
    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=20'),
    );
    if (response.statusCode == 200){
      final data = jsonDecode(response.body);
      final List results = data['results'];

      List<Map<String,dynamic>> loadedPokemon = [];

      for( int i= 0; i< results.length; i++){
        final name = results[i]['name'];
        final id= i+1;
        final imageUrl = '';
      }
    }
  }
}

class _PokemonListPageState extends State<PokemonListPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
