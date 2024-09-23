import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/features/fetchPokemons/presentation/store/pokemon_store.dart';
import 'package:pokedex/injection.dart';


class PokemonPage extends StatelessWidget {
  final pokemonStore = getIt<PokemonStore>();

  PokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    pokemonStore.fetchPokemons();

    return Scaffold(

      body: Observer(
        builder: (_) {
          if (pokemonStore.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: pokemonStore.pokemons.length,
            itemBuilder: (context, index) {
              final pokemon = pokemonStore.pokemons[index];
              return ListTile(
                title: Text(pokemon.name),
              );
            },
          );
        },
      ),
    );
  }
}
