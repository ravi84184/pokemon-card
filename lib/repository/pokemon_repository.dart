import '../service/pokemon_api_provider.dart';
import '../feature/pokemon_list/model/pokemon_card_model.dart';

class PokemonCardListResult {
  final List<PokemonCardModel> cards;
  final int totalCount;
  final int page;
  final int pageSize;

  PokemonCardListResult({
    required this.cards,
    required this.totalCount,
    required this.page,
    required this.pageSize,
  });
}

class PokemonRepository {
  final PokemonApiProvider apiProvider;

  PokemonRepository({required this.apiProvider});

  Future<PokemonCardListResult> fetchPokemonCards({
    int page = 1,
    int pageSize = 10,
  }) async {
    final json = await apiProvider.fetchPokemonCards(
      page: page,
      pageSize: pageSize,
    );
    final cards =
        (json['data'] as List<dynamic>?)
            ?.map((e) => PokemonCardModel.fromJson(e))
            .toList() ??
        [];
    final totalCount = json['totalCount'] ?? 0;
    return PokemonCardListResult(
      cards: cards,
      totalCount: totalCount,
      page: page,
      pageSize: pageSize,
    );
  }

  Future<PokemonCardListResult> searchPokemonCards({
    required String query,
    int page = 1,
    int pageSize = 10,
  }) async {
    final json = await apiProvider.searchPokemonCards(
      query: query,
      page: page,
      pageSize: pageSize,
    );
    final cards =
        (json['data'] as List<dynamic>?)
            ?.map((e) => PokemonCardModel.fromJson(e))
            .toList() ??
        [];
    return PokemonCardListResult(
      cards: cards,
      totalCount: json['totalCount'] ?? 0,
      page: page,
      pageSize: pageSize,
    );
  }
}
