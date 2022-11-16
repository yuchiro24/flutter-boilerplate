import 'package:aufguss_event_app/presentation/pages/web_socket_demo/web_socket_demo_page_notifier.dart';
import 'package:aufguss_event_app/presentation/widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WebSocketDemoPage extends HookConsumerWidget {
  const WebSocketDemoPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(webSocketDemoPageNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('web socket demo'),
      ),
      body: state.when(
        data: (value) {
          return ListView(
            children: value.map((e) => Text('$e')).toList(),
          );
        },
        error: (Object error, StackTrace? stackTrace) {
          return const SizedBox.shrink();
        },
        loading: () {
          return const OriginalProgress();
        },
      ),
    );
  }
}
