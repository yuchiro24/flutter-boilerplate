import 'package:aufguss_event_app/common/index.dart';
import 'package:aufguss_event_app/presentation/pages/create_room/create_room_page.dart';
import 'package:aufguss_event_app/presentation/pages/join_room/join_room_page_notifier.dart';
import 'package:aufguss_event_app/presentation/widgets/progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JoinRoomPage extends HookConsumerWidget {
  const JoinRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomIdController = useTextEditingController();
    roomIdController.addListener(
      () => ref
          .read(joinRoomPageNotifierProvider.notifier)
          .setRoomId(roomIdController.text),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: .5,
        title: const Text(
          'ルームに参加',
          style: TextStyle(
            color: karutaTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: karutaAppBarColor,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: roomIdController,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  borderSide: BorderSide(color: karutaBorderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  borderSide: BorderSide(color: karutaBorderColor),
                ),
                hintText: 'ルーム番号',
              ),
              style: const TextStyle(fontSize: 16, color: Colors.black),
              cursorColor: Colors.grey.shade400,
              autofocus: true,
              maxLength: 6,
              keyboardType: TextInputType.number,
            ),
            const Spacer(),
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
                onPressed: ref.watch(joinRoomPageNotifierProvider).joinStatus ==
                        JoinStatus.canTry
                    ? () async {
                        OriginalProgress.show(context);
                        await ref
                            .watch(joinRoomPageNotifierProvider.notifier)
                            .join();
                        OriginalProgress.dismiss(context);
                        await Navigator.of(context).push<void>(
                          CupertinoPageRoute(
                            builder: (context) => const CreateRoomPage(),
                          ),
                        );
                      }
                    : null,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    '次へ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
