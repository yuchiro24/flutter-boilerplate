import 'dart:convert';

import 'package:aufguss_event_app/common/index.dart';
import 'package:aufguss_event_app/presentation/pages/create_card/create_card_page_notifier.dart';
import 'package:aufguss_event_app/presentation/widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateCardPage extends HookConsumerWidget {
  const CreateCardPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createCardPageNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: karutaTextColor),
        elevation: .5,
        backgroundColor: karutaAppBarColor,
        title: const Text(
          'ふだを作成',
          style: TextStyle(
            color: karutaTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              final check = state.cardList
                  .where(
                    (ele) => ele.title != null && ele.title?.isNotEmpty == true,
                  )
                  .toList();
              if (check.length != state.cardList.length) {
                OriginalProgress.showMessageDialog(
                  context,
                  '',
                  '読み方が入力されてないふだがあります。',
                );
                return;
              }
              ref
                  .read(createCardPageNotifierProvider.notifier)
                  .sendCard(context);
            },
            child: const Text(
              '完了',
              style: TextStyle(
                color: karutaTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          state.cardList.isEmpty
              ? const Center(
                  child: Text(
                    '画像をアップロードして\nかるたのふだを作成しましょう',
                    style: TextStyle(
                      color: karutaGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.only(bottom: 250),
                  itemCount: state.cardList.length,
                  itemBuilder: (context, index) {
                    final card = state.cardList[index];
                    final bytes = base64.decode(card.imgBase64!);
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Image.memory(
                            bytes,
                            height: 80,
                            width: 80,
                            fit: BoxFit.fill,
                            gaplessPlayback: true,
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextField(
                              controller:
                                  TextEditingController(text: card.title ?? ''),
                              style: const TextStyle(
                                color: karutaBlackTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              decoration: const InputDecoration(
                                hintText: '読み方を入力',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  borderSide:
                                      BorderSide(color: karutaBorderColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  borderSide:
                                      BorderSide(color: karutaBorderColor),
                                ),
                              ),
                              cursorColor: Colors.grey.shade400,
                              onSubmitted: (title) {
                                ref
                                    .read(
                                      createCardPageNotifierProvider.notifier,
                                    )
                                    .setTitle(index, title);
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: SizedBox(
              width: context.deviceWidth,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: karutaButtonColor,
                  foregroundColor: karutaTextColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () async {
                  await ref
                      .read(createCardPageNotifierProvider.notifier)
                      .addCard();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    '画像をアップロード',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
