import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  bool get isDark => MediaQuery.of(this).platformBrightness == Brightness.dark;
  bool get isSafeArea => MediaQuery.of(this).viewPadding.bottom >= 34.0;
  double get deviceWidth => MediaQuery.of(this).size.width;
  double get deviceHeight => MediaQuery.of(this).size.height;
  void hideKeyboard() => FocusScope.of(this).unfocus();
  void dismiss<T extends Object>([T? result]) =>
      Navigator.of(this).pop<T>(result);
}
