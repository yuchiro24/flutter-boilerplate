import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigatorKeyProvider = Provider<GlobalKey<NavigatorState>>(
  (_) => GlobalKey<NavigatorState>(),
);
