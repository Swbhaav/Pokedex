import 'package:flutter/material.dart';
import 'package:pokidex/pages/home_page.dart';
import 'package:pokidex/pages/pokemonList_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      // Option 1: Direct navigation to Pokemon list
      home: const HomePage(),

      // Option 2: Or use a home page with navigation
      // home: const HomePage(),
    );
  }
}

