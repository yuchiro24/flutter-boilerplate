import 'package:aufguss_event_app/common/index.dart';
import 'package:aufguss_event_app/domain/entities/member/member.dart';
import 'package:aufguss_event_app/domain/notifiers/ai_talk/ai_talk_notifier.dart';
import 'package:aufguss_event_app/domain/notifiers/room/room_notifier.dart';
import 'package:aufguss_event_app/presentation/pages/create_card/create_card_page.dart';
import 'package:aufguss_event_app/presentation/pages/create_room/create_room_page_notifier.dart';
import 'package:aufguss_event_app/presentation/pages/game_playing/game_playing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateRoomPage extends HookConsumerWidget {
  const CreateRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomIdController = useTextEditingController();
    roomIdController.addListener(
      () => ref
          .read(createRoomPageNotifierProvider.notifier)
          .setRoomId(roomIdController.text),
    );

    final state = ref.watch(roomNotifierProvider);
    ref.listen<RoomState>(roomNotifierProvider, (p, next) async {
      if (next.roomStatus?.status == 'ready') {
        await ref.read(roomNotifierProvider.notifier).start();
      }
      if (next.roomStatus?.status == 'playing' && !next.isStopNav) {
        ref.read(roomNotifierProvider.notifier).setIsStopNav(value: true);
        await Navigator.of(context).push<void>(
          CupertinoPageRoute(builder: (context) => const GamePlayingPage()),
        );
      }
      if (next.board?.status == 'READING') {
        final date = DateTime.parse(next.board?.readStart ?? '');
        final now = DateTime.now();
        final diff = date.difference(now);
        await Future(() async {
          ref.read(roomNotifierProvider.notifier).timer(diff.inSeconds);
          await Future<void>.delayed(diff);
          final title = next.board?.card?.title ?? '';
          await ref.read(aiTalkProvider.notifier).fetch(title);
        });
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '参加ルーム',
          style: TextStyle(
            color: karutaTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: karutaAppBarColor,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'ルーム番号',
                      style: TextStyle(
                        color: karutaGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: TextField(
                            controller: roomIdController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                borderSide:
                                    BorderSide(color: karutaBackgroundColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                borderSide:
                                    BorderSide(color: karutaBackgroundColor),
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 16,
                              color: karutaBlackTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                            cursorColor: Colors.grey.shade400,
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            maxLength: 6,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () async {},
                          child: const Text(
                            'コピー',
                            style: TextStyle(
                              color: karutaGrey,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 8,
                    color: karutaButtonSecondColor,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: state.memberList.map(_memberItem).toList(),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      width: context.deviceWidth,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: karutaButtonColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push<void>(
                            CupertinoPageRoute(
                              builder: (_) => const CreateCardPage(),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            'ふだを作成する',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: context.deviceWidth,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: karutaButtonSecondColor,
                          foregroundColor: karutaBlackTextColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () async {
                          await ref.read(roomNotifierProvider.notifier).ready();
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            '準備完了',
                            style: TextStyle(
                              fontSize: 16,
                              color: karutaBlackTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _memberItem(Member member) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Text(
            member.name.isEmpty ? 'テスト' : member.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: karutaBlackTextColor,
            ),
          ),
          const Spacer(),
          Text(
            member.isReady ? '完了' : '準備中',
            style: const TextStyle(
              color: karutaGrey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
