import 'package:aufguss_event_app/common/index.dart';
import 'package:aufguss_event_app/providers/navigator.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'flavors.dart';
import 'presentation/pages/top/top_page.dart';

class App extends HookConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: F.title,
      navigatorKey: ref.watch(navigatorKeyProvider),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: karutaBackgroundColor,
      ),
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        ...AppLocalizations.localizationsDelegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const TopPage(),
    );
  }
}
