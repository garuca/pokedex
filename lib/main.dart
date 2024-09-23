import 'package:flutter/material.dart';
import 'package:pokedex/features/fetchPokemons/presentation/pages/pokemon_page.dart';
import 'package:pokedex/features/home/presentation/home_page.dart';
import 'injection.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),

      title: 'Pokémon App',
      home: HomePage(),
    );
  }
}
