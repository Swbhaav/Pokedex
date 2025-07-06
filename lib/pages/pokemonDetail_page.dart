import 'package:flutter/material.dart';
import 'package:pokidex/component/my_appbar.dart';
import 'package:pokidex/models/pokemon_model.dart';

class PokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonDetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: pokemon.name.toUpperCase()),

    );
  }
}
