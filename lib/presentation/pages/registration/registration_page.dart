import 'package:aufguss_event_app/common/index.dart';
import 'package:aufguss_event_app/presentation/pages/registration/registration_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistrationPage extends HookConsumerWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nicknameController = useTextEditingController();
    nicknameController.addListener(
      () => ref
          .read(registrationPageNotifierProvider.notifier)
          .setNickname(nicknameController.text),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: .5,
        title: const Text(
          'ニックネーム入力',
          style: TextStyle(color: karutaTextColor),
        ),
        backgroundColor: karutaAppBarColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextField(
                controller: nicknameController,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide(color: karutaBorderColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide(color: karutaBorderColor),
                  ),
                  hintText: 'ニックネームを入力',
                ),
                style: const TextStyle(fontSize: 16, color: Colors.black),
                cursorColor: Colors.grey.shade400,
                autofocus: true,
              ),
              const Spacer(),
              SizedBox(
                width: context.deviceWidth,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: karutaButtonColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: ref
                              .watch(registrationPageNotifierProvider)
                              .registerState ==
                          RegistrationStatus.invalid
                      ? null
                      : () => ref
                          .read(registrationPageNotifierProvider.notifier)
                          .register(context),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text('次へ'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
