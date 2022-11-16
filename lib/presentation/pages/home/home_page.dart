import 'package:aufguss_event_app/common/index.dart';
import 'package:aufguss_event_app/presentation/pages/create_room/create_room_page.dart';
import 'package:aufguss_event_app/presentation/pages/game_playing/game_playing_page.dart';
import 'package:aufguss_event_app/presentation/pages/home/home_garally_page.dart';
import 'package:aufguss_event_app/presentation/pages/home/home_page_notifier.dart';
import 'package:aufguss_event_app/presentation/pages/join_room/join_room_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: .5,
        title: const Text(
          'おもひでかるた',
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                'images/img_home.png',
                height: 300,
              ),
              const Spacer(),
              SizedBox(
                width: context.deviceWidth,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: karutaButtonColor,
                    foregroundColor: karutaBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push<void>(
                      CupertinoPageRoute(
                        builder: (_) => const CreateRoomPage(),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'ルームを作成',
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
                  onPressed: () {
                    Navigator.of(context).push<void>(
                      CupertinoPageRoute(
                        builder: (_) => const JoinRoomPage(),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'ルームに参加',
                      style: TextStyle(fontSize: 16),
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
                    await ref
                        .read(homePageNotifierProvider.notifier)
                        .fetchCards();
                    await Navigator.of(context).push<void>(
                      CupertinoPageRoute(
                        builder: (_) => const HomeGarallyPage(),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'ふだを見返す',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
