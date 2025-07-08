import 'package:flutter/material.dart';
import 'package:pokidex/component/my_appbar.dart';
import 'package:pokidex/models/pokemon_model.dart';

class PokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: pokemon.name.toUpperCase()),
      body: Stack(
        children: [
          SizedBox(width: double.infinity,),
          Image.network(
            pokemon.image,
            width: double.infinity,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
          ),
          scroll(),
        ],
      ),
    );
  }

  Widget scroll() {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 1.0,
      minChildSize: 0.6,

      builder: (context, scrollController) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: 5, width: 35, color: Colors.black),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
