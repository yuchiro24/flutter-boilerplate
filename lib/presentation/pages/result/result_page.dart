import 'package:aufguss_event_app/common/index.dart';
import 'package:aufguss_event_app/domain/entities/player/player.dart';
import 'package:aufguss_event_app/domain/notifiers/room/room_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../home/home_page.dart';

class ResultPage extends ConsumerWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final room = ref.watch(roomNotifierProvider);
    return Scaffold(
      backgroundColor: kAppWhite,
      appBar: AppBar(
        elevation: 0.5,
        title: const Text(
          '対戦結果',
          style: TextStyle(color: kAppBlack),
        ),
        backgroundColor: kAppWhite,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                itemBuilder: (_, index) {
                  final player = room.board!.players[index];
                  return _userTile(player, index);
                },
                itemCount: room.board!.players.length,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 20,
              left: 20,
              child: SizedBox(
                width: context.deviceWidth,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute<void>(
                        builder: (_) => const HomePage(),
                      ),
                      (route) => false,
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text('ホームにもどる'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _userTile(Player player, int index) {
    return Column(
      children: [
        ListTile(
          leading: Text(
            '${index + 1}',
            style: const TextStyle(color: kAppGray, fontSize: 16),
          ),
          title: Text(
            player.name ?? '',
            style: const TextStyle(color: kAppBlack, fontSize: 18),
          ),
          trailing: Text(
            '${player.count}枚',
            style: const TextStyle(color: kAppBlack, fontSize: 16),
          ),
        ),
        const Divider(
          height: 1,
        ),
      ],
    );
  }
}
