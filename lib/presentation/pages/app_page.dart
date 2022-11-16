import 'package:aufguss_event_app/presentation/pages/app_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppPage extends HookConsumerWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = appPageNotifierProvider;
    final notifier = ref.watch(provider.notifier);
    return WillPopScope(
      onWillPop: notifier.onWillPop,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            notifier.buildOffstageNavigator(0),
            notifier.buildOffstageNavigator(1),
            notifier.buildOffstageNavigator(2),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            )
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: ref
              .watch(
                provider.select<AppPageState>((AppPageState state) => state),
              )
              .selectedIndex,
          onTap: notifier.onItemTapped,
        ),
      ),
    );
  }
}
