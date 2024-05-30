import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_buzz/domain/core/helpers/logger.dart';
import 'package:social_buzz/presentation/start_up.dart';

void main() {
  setupLogger();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(child: Startup());
  }
}

