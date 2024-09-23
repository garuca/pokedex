import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/features/fetchPokemons/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex/features/fetchPokemons/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/features/fetchPokemons/domain/usecases/get_pokemons_usecase.dart';
import 'package:pokedex/features/fetchPokemons/presentation/store/pokemon_store.dart';



import 'core/network/dio_client.dart';


final getIt = GetIt.instance;

void
setup() {
  // Dio
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => DioClient(getIt<Dio>()));

  // Repositories
  getIt.registerLazySingleton<PokemonRepository>(
          () => PokemonRepositoryImpl(getIt<DioClient>()));

  // UseCases
  getIt.registerLazySingleton(() => GetPokemonsUseCase(getIt<PokemonRepository>()));

  // Stores
  getIt.registerLazySingleton(() => PokemonStore(getIt<GetPokemonsUseCase>()));
}
