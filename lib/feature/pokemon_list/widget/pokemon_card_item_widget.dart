import 'package:flutter/material.dart';
import 'package:pokemon_task/app_widget/app_catch_image.dart';
import '../model/pokemon_card_model.dart';

class PokemonCardItemWidget extends StatelessWidget {
  final PokemonCardModel card;
  final VoidCallback? onTap;

  const PokemonCardItemWidget({required this.card, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: Colors.yellow),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Hero(
                tag: card.id ?? '',
                child: AppCatchImage(
                  imageUrl: card.images?.small ?? '',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                card.name ?? '',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
