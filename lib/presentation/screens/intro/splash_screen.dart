import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_buzz/application/auth/auth_notifier.dart';
import 'package:social_buzz/presentation/screens/main/home/home_screen.dart';

class SplashScreen extends HookConsumerWidget {
  static const id = '/splash';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // useEffect(() {
    //   ref.watch(authNotifierProvider.notifier).getCurrentuser();
    //   return null;
    // }, []);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 3), () {
        ref.watch(getCurrentUser).when(
            data: (user) {
              Get.offAndToNamed(HomeScreen.id);
            },
            error: (error, stk) {},
            loading: () {});
      });
    });

    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Social Buzz',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
