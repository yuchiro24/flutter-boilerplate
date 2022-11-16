import 'package:flutter/material.dart';
import 'app.dart';
import 'flavors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import './common/configure/index.dart' as logger;

void main() {
  FlavorConfig(
    variables: {
      'baseUrl': 'http://localhost:8000/',
    },
  );
  F.appFlavor = Flavor.DEV;
  logger.configure();
  runApp(ProviderScope(child: App()));
}
