import 'package:aufguss_event_app/domain/notifiers/sample/sample_notifier.dart';
import 'package:aufguss_event_app/presentation/pages/app_tab_navigation.dart';
import 'package:aufguss_event_app/presentation/pages/sample/sample_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SamplePage extends TabWidgetPage {
  const SamplePage({Key? key}) : super(key: key);

  @override
  void onBottomNavigationTap() {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = samplePageNotifierProvider;
    final state = ref.watch(provider);
    final notifier = ref.watch(provider.notifier);
    final sampleProvider = sampleNotifierProvider;
    final sampleState = ref.watch(sampleProvider);
    final sampleNotifier = ref.watch(sampleProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text('さんぷる'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sampleNotifier.increment();
          notifier.increment();
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [
          Center(
            child: Text('さんぷる'),
          ),
          Center(
            child: Text('${sampleState.count}'),
          ),
          Center(
            child: Text('${state.selectedIndex}'),
          ),
        ],
      ),
    );
  }
}
