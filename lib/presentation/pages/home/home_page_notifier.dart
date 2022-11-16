import 'package:aufguss_event_app/common/index.dart';
import 'package:aufguss_event_app/domain/entities/card/card.dart';
import 'package:aufguss_event_app/domain/repository/dio/app_service.dart';
import 'package:aufguss_event_app/domain/repository/get_cards_response/get_cards_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'home_page_notifier.freezed.dart';

final homePageNotifierProvider =
    StateNotifierProvider<HomePageNotifier, HomePageState>(
  (ref) => HomePageNotifier(ref),
);

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default(<Card>[]) List<Card> cards,
  }) = _HomePageState;
}

class HomePageNotifier extends StateNotifier<HomePageState> {
  HomePageNotifier(this._ref) : super(const HomePageState());

  final Ref _ref;

  Future<void> fetchCards() async {
    final uri = _ref.read(appServiceProvider).endpoint('/cards/');
    try {
      final response = await _ref.read(appServiceProvider).get(
        uri,
        <String, dynamic>{},
      );
      final cards = GetCardsReponse.fromJson(response).results;
      state = state.copyWith(cards: cards);
    } on Exception catch (_) {
      throw Exception('failed to get cards');
    }
  }
}
