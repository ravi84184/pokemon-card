import 'package:dio/dio.dart';

class PokemonApiProvider {
  static const String _baseUrl = 'https://api.pokemontcg.io/v2/cards';
  final Dio _dio;

  PokemonApiProvider({Dio? dio}) : _dio = dio ?? Dio();

  Future<Map<String, dynamic>> fetchPokemonCards({
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {'page': page, 'pageSize': pageSize},
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      throw Exception('Failed to load: $e');
    }
  }

  Future<Map<String, dynamic>> searchPokemonCards({
    required String query,
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {
          'q': 'name:$query',
          'page': page,
          'pageSize': pageSize,
        },
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      throw Exception('Failed to search: $e');
    }
  }
}
