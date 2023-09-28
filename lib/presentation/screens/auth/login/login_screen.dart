import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_buzz/application/auth/auth_notifier.dart';
import 'package:social_buzz/application/auth/auth_states.dart';
import 'package:social_buzz/presentation/screens/auth/register/register_screen.dart';
import 'package:social_buzz/presentation/screens/main/home/home_screen.dart';
import 'package:social_buzz/presentation/widgets/customButtons.dart';

class LoginScreen extends HookConsumerWidget {
  static const id = '/login';

  final registerKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = ref.watch(authNotifierProvider.notifier);
    final authState = ref.watch(authNotifierProvider).isLoadingActivated;

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    ref.listen(authNotifierProvider, (_, AuthStates state) {
      state.userAuthenticatingStage.when(
          data: (stage) {
            if (stage == AuthEnumState.loggedIn) {
              Get.offAllNamed(HomeScreen.id);
            }
          },
          error: (error, stk) {},
          loading: () {});
    });
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Form(
              key: registerKey,
              child: Column(children: [
                const SizedBox(height: 40),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Email'),
                  controller: emailController,
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Password'),
                  controller: passwordController,
                ),
                const SizedBox(height: 30),
                const Spacer(),
                CustomButtons.primary(
                  text: 'Login',
                  onPressed: () => authProvider.login(
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                  isLoadingActive: authState,
                ).marginOnly(bottom: 20),
                Text.rich(TextSpan(
                  text: 'Do not have an account? ',
                  children: [
                    TextSpan(
                      text: 'Register',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.toNamed(RegisterScreen.id),
                    )
                  ],
                )),
              ]),
            )));
  }
}
