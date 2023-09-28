import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_buzz/domain/core/route/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(child: Startup());
  }
}

class Startup extends HookConsumerWidget {
  const Startup({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routeProvider);
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: router.initialPage,
      getPages: router.pages,
    );
  }
}
