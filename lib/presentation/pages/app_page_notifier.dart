import 'package:aufguss_event_app/presentation/pages/app_tab_navigation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'sample/sample_page.dart';

part 'app_page_notifier.freezed.dart';

final appPageNotifierProvider =
    StateNotifierProvider<AppPageNotifier, AppPageState>(
  (ref) => AppPageNotifier(ref),
);

@freezed
class AppPageState with _$AppPageState {
  const factory AppPageState({
    @Default(0) int selectedIndex,
  }) = _AppPageState;
}

class AppPageNotifier extends StateNotifier<AppPageState>
    with LocatorMixin, WidgetsBindingObserver {
  AppPageNotifier(
    this._ref,
  ) : super(
          const AppPageState(
            selectedIndex: 0,
          ),
        ) {
    Future<void>.delayed(Duration.zero, _configure);
  }
  final Ref _ref;

  final List<TabWidgetPage> widgetList = [
    const SamplePage(),
    const SamplePage(),
    const SamplePage(),
  ];

  final Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
  };

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        _background();
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  void _configure() {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void onItemTapped(int index) {
    widgetList[index].onBottomNavigationTap();
    state = state.copyWith(selectedIndex: index);
  }

  Future<bool> onWillPop() async {
    final keyTab = navigatorKeys[state.selectedIndex];
    if (keyTab!.currentState!.canPop()) {
      return !await keyTab.currentState!.maybePop();
    }
    return Future.value(true);
  }

  Widget buildOffstageNavigator(int index) {
    return Offstage(
      offstage: index != state.selectedIndex,
      child: TabNavigator(
        // ignore: cast_nullable_to_non_nullable
        navigatorKey: navigatorKeys[index] as GlobalKey<NavigatorState>,
        page: widgetList[index],
      ),
    );
  }

  Future<void> _background() async {
    // logger.info('background selectedTabIndex: ${state.selectedIndex}');
    // if (state.selectedIndex != 1) {
    //   return;
    // }
  }
}
