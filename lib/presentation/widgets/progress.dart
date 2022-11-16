import 'package:aufguss_event_app/common/color.dart';
import 'package:flutter/material.dart';

class OriginalProgress extends StatelessWidget {
  const OriginalProgress({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    showDialog<dynamic>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const OriginalProgress();
      },
    );
  }

  static void dismiss(BuildContext context) {
    Navigator.pop(context);
  }

  static void rootDismiss(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  // Scaffold 配下で使用するときは、Builder メソッドを使用しなければいけない。
  // 同じBuildContextを使用すると、エラーが発生ため。
  static void showInfo(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static void showInfoUsingScaffoldKey(
    GlobalKey<ScaffoldMessengerState> scaffoldKey,
    String message,
  ) {
    // TODO(Minato): あとでなおす
    scaffoldKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static void showMessageDialog(
    BuildContext context,
    String title,
    String message, {
    String positiveText = 'OK',
    bool cancelable = true,
    VoidCallback? onPressed,
  }) {
    showDialog<dynamic>(
      context: context,
      barrierDismissible: cancelable,
      builder: (context) => AlertDialog(
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: onPressed ?? () => Navigator.pop(context),
            child: Text(
              positiveText,
              style: const TextStyle(
                color: kAppBlack,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  static void showConfirmDialog(
    BuildContext context,
    VoidCallback onPressed, {
    String title = '',
    String message = '',
    String negativeText = 'No',
    String positiveText = 'Yes',
    bool cancelable = true,
  }) {
    showDialog<dynamic>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              negativeText,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              positiveText,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void showSelectableDialog(
    BuildContext context,
    VoidCallback onTapLeftButton,
    VoidCallback onTapRightButton, {
    String message = '',
    String title = '',
    String leftText = '',
    String rightText = '',
  }) {
    showDialog<dynamic>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: onTapLeftButton,
            child: Text(
              leftText,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: onTapRightButton,
            child: Text(
              rightText,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: const [
            SizedBox(
              height: 80,
              width: 80,
              child: CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
