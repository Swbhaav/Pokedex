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
      appBar: MyAppbar(title: widget.pokemon.name.toUpperCase()),
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
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
           child: Padding(
            padding: EdgeInsets.all(25),
            child: Text("Name: " + widget.pokemon.name.toUpperCase()),

          ),


        ),
        SizedBox(height: 15), // Spacing




      ],
    );
  }
}
