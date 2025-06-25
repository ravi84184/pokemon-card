import 'package:get/get.dart';
import 'package:pokemon_task/feature/pokemon_list/pokemon_list_screen.dart';
import 'package:pokemon_task/binding/pokemon_list_binding.dart';
import 'package:pokemon_task/feature/pokemon_details/pokemon_detail_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.pokemonList,
      page: () => PokemonListScreen(),
      binding: PokemonListBinding(),
    ),
    GetPage(
      name: AppRoutes.pokemonDetail,
      page: () {
        final card = Get.arguments;
        return PokemonDetailPage(card: card);
      },
    ),
    // Add more pages as needed
  ];
}
