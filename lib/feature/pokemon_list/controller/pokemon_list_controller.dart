// Make sure to add get: ^4.6.5 (or latest) to your pubspec.yaml
import 'package:get/get.dart';
import '../../../repository/pokemon_repository.dart';
import '../model/pokemon_card_model.dart';

class PokemonListController extends GetxController {
  final PokemonRepository repository;

  PokemonListController({required this.repository});

  RxList<PokemonCardModel> cards = <PokemonCardModel>[].obs;
  RxBool isLoading = false.obs;
  RxString error = ''.obs;
  RxInt page = 1.obs;
  final int pageSize = 10;
  RxInt totalCount = 0.obs;
  RxString searchQuery = ''.obs;
  RxBool isLastPage = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCards();
  }

  Future<void> fetchCards({int page = 1}) async {
    isLoading.value = true;
    error.value = '';
    try {
      final result = await repository.fetchPokemonCards(
        page: page,
        pageSize: pageSize,
      );
      if (page == 1) {
        cards.value = result.cards;
      } else {
        cards.addAll(result.cards);
      }
      this.page.value = page;
      totalCount.value = result.totalCount;
      isLastPage.value = cards.length >= result.totalCount;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> searchCards(String query, {int page = 1}) async {
    isLoading.value = true;
    error.value = '';
    searchQuery.value = query;
    try {
      final result = await repository.searchPokemonCards(
        query: query,
        page: page,
        pageSize: pageSize,
      );
      if (page == 1) {
        cards.value = result.cards;
      } else {
        cards.addAll(result.cards);
      }
      this.page.value = page;
      totalCount.value = result.totalCount;
      isLastPage.value = cards.length >= result.totalCount;
      isLoading.value = false;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void loadNextPage() {
    if (!isLastPage.value && !isLoading.value) {
      if (searchQuery.value.isEmpty) {
        fetchCards(page: page.value + 1);
      } else {
        searchCards(searchQuery.value, page: page.value + 1);
      }
    }
  }

  void refreshList() {
    if (searchQuery.value.isEmpty) {
      fetchCards(page: 1);
    } else {
      searchCards(searchQuery.value, page: 1);
    }
  }
}
