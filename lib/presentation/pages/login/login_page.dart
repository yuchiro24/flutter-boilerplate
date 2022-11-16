import 'package:aufguss_event_app/presentation/widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passController = useTextEditingController();
    final isObscure = useState(true);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('ログイン'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              enabled: true,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                hintText: 'test@test.com',
                labelText: 'email',
              ),
            ),
            TextField(
              controller: passController,
              enabled: true,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'パスワード',
                suffixIcon: IconButton(
                  icon: isObscure.value
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  onPressed: () {
                    isObscure.value = !isObscure.value;
                  },
                ),
              ),
              obscureText: isObscure.value,
            ),
            ElevatedButton(
              onPressed: () async {
                OriginalProgress.showInfo(
                  context,
                  'email: ${emailController.text}, pass: ${passController.text}',
                );
                OriginalProgress.show(context);
                await Future<void>.delayed(const Duration(seconds: 1));
                OriginalProgress.dismiss(context);
              },
              child: const Text('ログイン'),
            ),
          ],
        ),
      ),
    );
  }
}
