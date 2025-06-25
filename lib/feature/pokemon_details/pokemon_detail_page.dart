import 'package:flutter/material.dart';
import '../pokemon_list/model/pokemon_card_model.dart';
import 'package:pokemon_task/app_widget/app_catch_image.dart';

class PokemonDetailPage extends StatelessWidget {
  final PokemonCardModel card;
  const PokemonDetailPage({required this.card, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(card.name ?? '')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: card.id ?? '',
              child: AppCatchImage(
                imageUrl: card.images?.large ?? card.images?.small ?? '',
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.6,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 16),
            Text(
              card.name ?? '',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            if (card.hp != null && card.hp!.isNotEmpty)
              Text('HP: ${card.hp}', style: TextStyle(fontSize: 16)),
            if (card.supertype != null && card.supertype!.isNotEmpty)
              Text(
                'Super type: ${card.supertype}',
                style: TextStyle(fontSize: 16),
              ),
            if (card.subtypes != null && card.subtypes!.isNotEmpty)
              Text(
                'Sub type: ${card.subtypes!.join(',')}',
                style: TextStyle(fontSize: 16),
              ),
            SizedBox(height: 16),
            if (card.set != null && card.set!.name != null) ...[
              Text(
                'Set: ${card.set!.name} (${card.set!.releaseDate})',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              AppCatchImage(
                imageUrl: card.set!.images!.symbol ?? '',
                height: 50,
              ),
              Text(
                'Series: ${card.set!.series ?? ''}',
                style: TextStyle(fontSize: 16),
              ),
            ],
            if (card.artist != null)
              Text('Artist: ${card.artist}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            if (card.attacks != null && card.attacks!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Attacks:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ...card.attacks!.map(
                    (atk) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${atk.name}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Cost: ${atk.cost!.join('')}'),
                          Text('Damage: ${atk.damage}'),
                          Text('Effect: ${atk.text}'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(height: 16),
            if (card.weaknesses != null && card.weaknesses!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Weaknesses:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ...card.weaknesses!.map(
                    (w) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text('- ${w.type ?? ''}: ${w.value ?? ''}'),
                    ),
                  ),
                ],
              ),
            if (card.resistances != null && card.resistances!.isNotEmpty) ...[
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Resistances:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ...card.resistances!.map(
                    (w) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text('- ${w.type ?? ''}: ${w.value ?? ''}'),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
