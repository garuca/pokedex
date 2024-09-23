import '../../domain/entities/pokemon.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../models/pokemon_model.dart';
import '../../../../core/network/dio_client.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final DioClient dioClient;

  PokemonRepositoryImpl(this.dioClient);

  @override
  Future<List<Pokemon>> getPokemons() async {
    final response = await dioClient.get('pokemon');
    final results = (response.data['results'] as List)
        .map((pokemon) => PokemonModel.fromJson(pokemon))
        .toList();

    return results
        .map((pokemonModel) => Pokemon(
              name: pokemonModel.name,
              url: pokemonModel.url,
            ))
        .toList();
  }
}
