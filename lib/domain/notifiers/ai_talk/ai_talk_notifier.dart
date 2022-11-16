import 'package:audio_session/audio_session.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final aiTalkProvider = StateNotifierProvider<AiTalkNotifier, String>((ref) {
  return AiTalkNotifier(ref);
});

class AiTalkNotifier extends StateNotifier<String> {
  AiTalkNotifier(this._ref) : super('');

  AudioPlayer? player;

  final Ref _ref;

  Future<void> fetch(String text) async {
    final url =
        'https://webapi.aitalk.jp/webapi/v5/ttsget.php?username=spajam2022&password=gGLgPWBp&speaker_name=nozomi&text=$text&ext=mp3';
    player = AudioPlayer();
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    await player?.setUrl(
      Uri.encodeFull(url),
    );
    await player?.play();
    player?.playbackEventStream.listen((event) {
      print(event.processingState);
    });
  }

  Future<void> stop() async {
    await player?.stop();
  }
}
