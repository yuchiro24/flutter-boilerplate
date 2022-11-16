import 'dart:async';

import 'package:aufguss_event_app/domain/repository/web_socket/web_socket_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final webSocketDemoPageNotifierProvider = StateNotifierProvider.autoDispose<
    WebSocketDemoPageNotifier, AsyncValue<List<String>>>((ref) {
  return WebSocketDemoPageNotifier(ref);
});

class WebSocketDemoPageNotifier
    extends StateNotifier<AsyncValue<List<String>>> {
  WebSocketDemoPageNotifier(this._ref) : super(const AsyncValue.loading()) {
    _init();
  }

  final Ref _ref;
  WebSocketRepository get webSocketRepository =>
      _ref.read(webSocketRepositoryProvider);

  @override
  void dispose() {
    webSocketRepository.close();
    streamSubscription?.cancel();
    super.dispose();
  }

  StreamSubscription<dynamic>? streamSubscription;
  Future<void> _init() async {
    await streamSubscription?.cancel();
    streamSubscription = webSocketRepository.listen().listen((dynamic event) {
      state = state.value == null
          ? AsyncValue.data([event as String])
          : AsyncValue.data(state.value!..add('$event'));
    });
  }
}
