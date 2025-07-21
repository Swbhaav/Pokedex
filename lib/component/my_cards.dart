import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/pokemon_model.dart';



class MyCards extends StatelessWidget {
  final _Pokemon = Pokemon(name: '', image: '',height: 0, weight: 0);
  final String image;
  final String name;
  final int id;
  final VoidCallback? onTap;
   MyCards({super.key,
    required this.image,
    required this.name,
    required this.id,
    this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               SvgPicture.network(
                  image,
                  height: 100,
                  width: 100,
                 fit: BoxFit.contain,
                 placeholderBuilder: (BuildContext context) => Container(
                   padding: EdgeInsets.all(30),
                   child: const CircularProgressIndicator(),
                 ),
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
                name.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('#$id', style: TextStyle(color: Colors.grey[600]),)
              
            ],
        ),
      ),
    );
  }
}
