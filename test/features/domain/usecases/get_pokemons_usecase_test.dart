import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/features/fetchPokemons/domain/entities/pokemon.dart';
import 'package:pokedex/features/fetchPokemons/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/features/fetchPokemons/domain/usecases/get_pokemons_usecase.dart';


import 'get_pokemons_usecase_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late GetPokemonsUseCase useCase;
  late MockPokemonRepository mockPokemonRepository;

  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    useCase = GetPokemonsUseCase(mockPokemonRepository);
  });

  final tPokemonList = [
    Pokemon(name: 'Bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
    Pokemon(name: 'Ivysaur', url: 'https://pokeapi.co/api/v2/pokemon/2/')
  ];

  test('Deve retornar uma lista de Pokémon do repositório', () async {
    // Arrange
    when(mockPokemonRepository.getPokemons()).thenAnswer((_) async => tPokemonList);

    // Act
    final result = await useCase();

    // Assert
    expect(result, tPokemonList);
    verify(mockPokemonRepository.getPokemons());
    verifyNoMoreInteractions(mockPokemonRepository);
  });
}
