import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokidex/component/my_appbar.dart';
import 'package:pokidex/models/pokemon_model.dart';

class PokemonDetailPage extends StatefulWidget {
  final Pokemon pokemon;

  PokemonDetailPage({super.key, required this.pokemon});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: MyAppbar(
        title: widget.pokemon.name.toUpperCase(),
        action: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.favorite),

          )],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            height: height * 0.5,
            child: Center(
              child: SvgPicture.network(
                widget.pokemon.image,
                width: width,
                height: height * 0.25,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            height: height * 0.5,
            child: Center(child: scroll()),
          ),
        ],
      ),
    );
  }

  Widget scroll() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Name: ' + widget.pokemon.name.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  Text(
                    'Height: ${widget.pokemon.height}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  Text(
                    'Type: ' + widget.pokemon.types.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  Text(
                    'Abilities: ' + widget.pokemon.abilities.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
