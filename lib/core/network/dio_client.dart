import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient(this.dio) {
    dio.options.baseUrl = 'https://pokeapi.co/api/v2/';
  }

  Future<Response> get(String endpoint) async {
    try {
      final response = await dio.get(endpoint);
      return response;
    } catch (e) {
      throw Exception('Erro ao buscar dados');
    }
  }
}
