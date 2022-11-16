import 'dart:async';

import 'package:aufguss_event_app/domain/repository/shared_preference/shared_preference_key.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';

final webSocketRepositoryProvider =
    Provider.autoDispose<WebSocketRepository>((ref) {
  return WebSocketRepository();
});

class WebSocketRepository {
  IOWebSocketChannel? channel;

  IOWebSocketChannel socket(String roomId, String token) =>
      IOWebSocketChannel.connect(
        Uri.parse(
          'wss://spajam2022.volare.site/ws/room/$roomId/',
        ),
        headers: <String, dynamic>{'Authorization': 'JWT $token'},
      );

  Future<IOWebSocketChannel> setChannel(String roomId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(SharedPreferencesKey.authToken.rawValue);
    return IOWebSocketChannel.connect(
      Uri.parse(
        'wss://spajam2022.volare.site/ws/room/$roomId/',
      ),
      headers: <String, dynamic>{'Authorization': 'JWT $token'},
    );
  }

  Stream<dynamic> listen() {
    return channel!.stream;
  }

  Future<void> close() async {
    await channel!.sink.close();
  }

  Future<void> post(String value) async {
    channel!.sink.add(value);
  }
}
