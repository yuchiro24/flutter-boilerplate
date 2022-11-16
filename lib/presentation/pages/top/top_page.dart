import 'package:aufguss_event_app/common/index.dart';
import 'package:aufguss_event_app/presentation/pages/top/top_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopPage extends HookConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(topPageNotifierProvider.notifier);
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          notifier.init(context);
        });
        return null;
      },
      const [],
    );
    return Scaffold(
      appBar: AppBar(
        elevation: .5,
        backgroundColor: karutaAppBarColor,
        title: const Text(
          'トップ画面',
          style: TextStyle(
            color: karutaTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
