import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon_task/service/pokemon_api_provider.dart';
import 'package:pokemon_task/repository/pokemon_repository.dart';

import 'pokemon_repository_test.mocks.dart';

@GenerateMocks([PokemonApiProvider])
void main() {
  group('PokemonRepository', () {
    late PokemonRepository pokemonRepository;
    late MockPokemonApiProvider mockPokemonApiProvider;

    setUp(() {
      mockPokemonApiProvider = MockPokemonApiProvider();
      pokemonRepository = PokemonRepository(
        apiProvider: mockPokemonApiProvider,
      );
    });

    test('fetchPokemonCards on success', () async {
      final mockData = {
        'data': [
          {
            'id': 'sv3pt5-1',
            'name': 'Bulbasaur',
            'images': {'small': 'https://images.pokemontcg.io/sv3pt5/1.png'},
          },
        ],
        'totalCount': 1,
        'page': 1,
        'pageSize': 1,
      };

      when(
        mockPokemonApiProvider.fetchPokemonCards(page: 1, pageSize: 10),
      ).thenAnswer((_) async => mockData);

      final result = await pokemonRepository.fetchPokemonCards(
        page: 1,
        pageSize: 10,
      );

      expect(result, isA<PokemonCardListResult>());
      expect(result.cards.length, 1);
      expect(result.cards[0].name, 'Bulbasaur');
      expect(result.totalCount, 1);
    });

    test('fetchPokemonCards on error', () async {
      when(
        mockPokemonApiProvider.fetchPokemonCards(page: 1, pageSize: 10),
      ).thenThrow(Exception('Failed to fetch data'));

      expect(
        () => pokemonRepository.fetchPokemonCards(page: 1, pageSize: 10),
        throwsA(isA<Exception>()),
      );
    });

    test('searchPokemonCards on success', () async {
      final mockData = {
        'data': [
          {
            'id': 'sv3pt5-25',
            'name': 'Pikachu',
            'images': {'small': 'https://images.pokemontcg.io/sv3pt5/25.png'},
          },
        ],
        'totalCount': 1,
        'page': 1,
        'pageSize': 1,
      };

      when(
        mockPokemonApiProvider.searchPokemonCards(
          query: 'Pikachu',
          page: 1,
          pageSize: 10,
        ),
      ).thenAnswer((_) async => mockData);

      final result = await pokemonRepository.searchPokemonCards(
        query: 'Pikachu',
        page: 1,
        pageSize: 10,
      );

      expect(result, isA<PokemonCardListResult>());
      expect(result.cards.length, 1);
      expect(result.cards[0].name, 'Pikachu');
      expect(result.totalCount, 1);
    });

    test('searchPokemonCards on error', () async {
      when(
        mockPokemonApiProvider.searchPokemonCards(
          query: 'Pikachu',
          page: 1,
          pageSize: 10,
        ),
      ).thenThrow(Exception('Failed to fetch data'));

      expect(
        () => pokemonRepository.searchPokemonCards(
          query: 'Pikachu',
          page: 1,
          pageSize: 10,
        ),
        throwsA(isA<Exception>()),
      );
    });
  });
}
