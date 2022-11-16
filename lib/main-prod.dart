import 'package:flutter/material.dart';
import 'app.dart';
import 'flavors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:aufguss_event_app/common/logger.dart';
import './common/logger.dart' as logger;

void main() {
  FlavorConfig(
    variables: {
      'baseUrl': 'https://spajam2022.volare.site/',
    },
  );
  F.appFlavor = Flavor.PROD;
  logger.configure();
  runApp(ProviderScope(child: App()));
}
