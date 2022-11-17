import 'package:aufguss_event_app/common/color.dart';
import 'package:aufguss_event_app/presentation/pages/app_page.dart';
import 'package:aufguss_event_app/providers/navigator.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'flavors.dart';

class App extends HookConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: F.title,
      navigatorKey: ref.watch(navigatorKeyProvider),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: kAppWhite,
      ),
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      // 下タブを使わない場合はTopPageに置き換える
      home: const AppPage(),
    );
  }
}
