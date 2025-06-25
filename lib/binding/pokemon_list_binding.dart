import 'package:get/get.dart';
import '../service/pokemon_api_provider.dart';
import '../repository/pokemon_repository.dart';
import '../feature/pokemon_list/controller/pokemon_list_controller.dart';

class PokemonListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PokemonApiProvider());
    Get.lazyPut(() => PokemonRepository(apiProvider: Get.find()));
    Get.lazyPut(() => PokemonListController(repository: Get.find()));
  }
}
