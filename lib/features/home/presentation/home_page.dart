import 'package:flutter/material.dart';
import 'package:pokedex/features/callNative/native_channel_page.dart';
import 'package:pokedex/features/fetchPokemons/presentation/pages/pokemon_page.dart';


class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.catching_pokemon)),
              Tab(icon: Icon(Icons.chat)),
            ],
          ),
          title: const Text('Projeto Mirante'),
        ),
        body: TabBarView(
          children: [
            PokemonPage(),
            const NativeChannelPage()
          ],
        ),
      ),
    );
  }
}
