import 'package:flutter/material.dart';
import 'package:pokidex/component/my_appbar.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: "Pokemon Details"),
    );
  }
}
