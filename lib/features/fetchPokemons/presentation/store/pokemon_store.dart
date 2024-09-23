import 'package:mobx/mobx.dart';

import '../../domain/entities/pokemon.dart';
import '../../domain/usecases/get_pokemons_usecase.dart';

part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  final GetPokemonsUseCase getPokemonsUseCase;

  _PokemonStoreBase(this.getPokemonsUseCase);

  @observable
  ObservableList<Pokemon> pokemons = ObservableList<Pokemon>();

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchPokemons() async {
    isLoading = true;
    final result = await getPokemonsUseCase();
    pokemons.addAll(result);
    isLoading = false;
  }
}
