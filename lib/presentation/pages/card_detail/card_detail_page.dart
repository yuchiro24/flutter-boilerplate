import 'package:aufguss_event_app/common/index.dart';
import 'package:aufguss_event_app/domain/entities/board/board.dart';
import 'package:aufguss_event_app/domain/notifiers/room/room_notifier.dart';
import 'package:aufguss_event_app/domain/repository/dio/app_dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CardDetailPage extends HookConsumerWidget {
  const CardDetailPage(this.board, {Key? key}) : super(key: key);
  final Board board;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseUrl = AppDio.baseUrl;
    return Scaffold(
      backgroundColor: kAppWhite,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  baseUrl + board.card!.img,
                  width: context.deviceWidth,
                  height: context.deviceWidth * 0.848,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 30,
                  left: 30,
                  child: SizedBox(
                    height: 56,
                    width: 56,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: karutaButtonColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: kAppWhite),
                      ),
                      child: Center(
                        child: Text(
                          board.card?.title![0] ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: kAppWhite,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    board.card!.title ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      color: kAppBlack,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Text(
                    'スパニャン',
                    style: TextStyle(
                      fontSize: 12,
                      color: kAppGray,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: kAppWhite450,
              height: 1,
            ),
            SizedBox(
              height: context.deviceWidth * 0.6,
              child: ListView(
                children: board.players.map((player) {
                  final index =
                      board.players.indexWhere((ele) => ele == player);
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 32),
                    leading: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: kAppGray,
                        fontSize: 16,
                      ),
                    ),
                    title: Text(
                      player.name ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        color: kAppBlack,
                      ),
                    ),
                    trailing: SizedBox(
                      width: 65,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          player.id == board.takenPlayerId
                              ? const Text(
                                  '+1',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: kAppGray,
                                  ),
                                )
                              : const SizedBox.shrink(),
                          Text(
                            '${player.count}枚',
                            style: const TextStyle(
                              fontSize: 16,
                              color: kAppBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: context.deviceWidth,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: karutaButtonColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    await ref.read(roomNotifierProvider.notifier).next();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text('次に進む'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
