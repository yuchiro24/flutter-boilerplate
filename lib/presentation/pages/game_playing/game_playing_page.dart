import 'package:aufguss_event_app/common/index.dart';
import 'package:aufguss_event_app/domain/notifiers/ai_talk/ai_talk_notifier.dart';
import 'package:aufguss_event_app/domain/notifiers/room/room_notifier.dart';
import 'package:aufguss_event_app/domain/repository/dio/app_dio.dart';
import 'package:aufguss_event_app/presentation/pages/card_detail/card_detail_page.dart';
import 'package:aufguss_event_app/presentation/pages/result/result_page.dart';
import 'package:aufguss_event_app/presentation/widgets/progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GamePlayingPage extends HookConsumerWidget {
  const GamePlayingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final room = ref.watch(roomNotifierProvider);
    final board = room.board;
    final baseUrl = AppDio.baseUrl;

    useEffect(
      () {
        Future(() {
          ref.read(roomNotifierProvider.notifier).countTimer.onStartTimer();
        });
        return null;
      },
      [],
    );

    ref.listen<RoomState>(roomNotifierProvider, (previous, next) {
      if (previous?.board?.status == 'RESULT' &&
          next.board?.status == 'READING') {
        Navigator.of(context).pop();
        return;
      } else if (next.board?.status == 'RESULT') {
        final board = next.board!;
        ref.read(aiTalkProvider.notifier).stop();
        Navigator.of(context).push<void>(
          CupertinoPageRoute(
            builder: (context) => CardDetailPage(board),
            fullscreenDialog: true,
          ),
        );
      } else if (next.board?.status == 'FINISHED') {
        Navigator.of(context).push<void>(
          CupertinoPageRoute(
            builder: (context) => const ResultPage(),
          ),
        );
      }
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: karutaAppBarColor,
        elevation: .5,
        title: const Text(
          'ふだをタップ',
          style: TextStyle(
            color: karutaTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(
        children: [
          board == null
              ? const OriginalProgress()
              : GridView.count(
                  padding: const EdgeInsets.all(8),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  crossAxisCount: 2,
                  childAspectRatio: 0.79,
                  children: board.cards.map((card) {
                    return InkWell(
                      onTap: () async {
                        await ref
                            .read(roomNotifierProvider.notifier)
                            .take(card.id);
                      },
                      child: Stack(
                        children: [
                          SizedBox(
                            height: context.deviceHeight,
                            width: context.deviceWidth,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(color: kAppBorder, width: 4),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    baseUrl + card.img,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 8,
                            top: 8,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: karutaAppBarColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  card.title?[0] ?? '',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: karutaTextColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ),
          StreamBuilder(
              stream:
                  ref.read(roomNotifierProvider.notifier).countTimer.secondTime,
              initialData: ref
                  .read(roomNotifierProvider.notifier)
                  .countTimer
                  .secondTime
                  .value,
              builder: (context, snapshot) {
                final second = snapshot.data as int;
                print(second);
                if (second == 0) {
                  return const SizedBox.shrink();
                }
                return SizedBox(
                  height: context.deviceHeight,
                  width: context.deviceWidth,
                  child: ColoredBox(
                    color: kAppBlack50.withOpacity(0.8),
                    child: Center(
                      child: SizedBox(
                        height: 80,
                        width: context.deviceWidth,
                        child: ColoredBox(
                          color: green,
                          child: Center(
                            child: Text(
                              '$second',
                              style: const TextStyle(
                                fontSize: 40,
                                color: kAppWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
