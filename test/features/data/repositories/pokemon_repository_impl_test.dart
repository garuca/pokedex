import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart' as dio;
import 'package:pokedex/core/network/dio_client.dart';
import 'package:pokedex/features/fetchPokemons/data/models/pokemon_model.dart';
import 'package:pokedex/features/fetchPokemons/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex/features/fetchPokemons/domain/entities/pokemon.dart';

import 'pokemon_repository_impl_test.mocks.dart';

@GenerateMocks([DioClient])
void main() {
  late PokemonRepositoryImpl repository;
  late MockDioClient mockDioClient;

  setUp(() {
    mockDioClient = MockDioClient();
    repository = PokemonRepositoryImpl(mockDioClient);
  });

  final tPokemonModelList = [
    PokemonModel(name: 'Bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
    PokemonModel(name: 'Ivysaur', url: 'https://pokeapi.co/api/v2/pokemon/2/')
  ];

  final tPokemonList = tPokemonModelList
      .map((pokemonModel) => Pokemon(name: pokemonModel.name, url: pokemonModel.url))
      .toList();

  test('Deve retornar uma lista de Pokémon quando a requisição for bem-sucedida', () async {
    // Arrange
    when(mockDioClient.get('pokemon')).thenAnswer((_) async => dio.Response(
      data: {
        'results': tPokemonModelList.map((e) => e.toJson()).toList(),
      },
      statusCode: 200,
      requestOptions: dio.RequestOptions(path: ''),
    ));

    // Act
    final result = await repository.getPokemons();

    // Assert
    expect(result, tPokemonList);
    verify(mockDioClient.get('pokemon'));
    verifyNoMoreInteractions(mockDioClient);
  });
}
