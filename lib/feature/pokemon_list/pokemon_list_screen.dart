import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_task/feature/pokemon_list/widget/pokemon_card_item_widget.dart';
import 'controller/pokemon_list_controller.dart';
import 'package:pokemon_task/app/routes/app_routes.dart';
import 'package:shimmer/shimmer.dart';

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PokemonListController>();
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          if (controller.searchQuery.value.isNotEmpty) {
            return TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search Pokémon...',
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    controller.searchQuery.value = '';
                    controller.refreshList();
                  },
                ),
              ),
              onSubmitted: (query) {
                if (query.trim().isNotEmpty) {
                  controller.searchCards(query.trim());
                }
              },
              onChanged: (query) {
                if (query.isEmpty) {
                  controller.searchQuery.value = '';
                  controller.refreshList();
                }
              },
            );
          } else {
            return Text("Pokémon");
          }
        }),
        actions: [
          Obx(() {
            if (controller.searchQuery.value.isEmpty) {
              return IconButton(
                onPressed: () {
                  controller.searchQuery.value = ' '; // triggers search bar
                },
                icon: Icon(Icons.search),
              );
            } else {
              return SizedBox.shrink();
            }
          }),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.cards.isEmpty) {
          // Show shimmer grid placeholders
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 16,
                            width: 80,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
        if (controller.error.isNotEmpty) {
          return Center(child: Text(controller.error.value));
        }
        if (controller.cards.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search_off, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  controller.searchQuery.value.trim().isNotEmpty
                      ? 'No Pokémon found for your search.'
                      : 'No Pokémon cards available.',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }
        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (!controller.isLastPage.value &&
                !controller.isLoading.value &&
                scrollInfo.metrics.pixels >=
                    scrollInfo.metrics.maxScrollExtent - 200) {
              controller.loadNextPage();
            }
            return false;
          },
          child: RefreshIndicator(
            onRefresh: () async => controller.refreshList(),
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount:
                  controller.cards.length +
                  (controller.isLoading.value ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < controller.cards.length) {
                  final card = controller.cards[index];
                  return PokemonCardItemWidget(
                    card: card,
                    onTap: () {
                      Get.toNamed(AppRoutes.pokemonDetail, arguments: card);
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        );
      }),
    );
  }
}
