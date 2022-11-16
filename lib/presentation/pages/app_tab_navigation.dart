import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class TabWidgetPage extends HookConsumerWidget {
  const TabWidgetPage({Key? key}) : super(key: key);
  void onBottomNavigationTap();
}

class TabNavigatorRoutes {
  static const String root = '/';
}

class TabNavigator extends HookWidget {
  const TabNavigator({
    Key? key,
    required this.navigatorKey,
    required this.page,
  }) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;
  final TabWidgetPage page;

  Map<String?, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes.root: (context) => page,
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute<StatefulWidget>(
          // ignore: cast_nullable_to_non_nullable
          builder: routeBuilders[routeSettings.name] as Widget Function(
            BuildContext,
          ),
        );
      },
    );
  }
}
