import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omama/global_states.dart';

import 'global_theme.dart';
import "screens/home.dart";

Future<void> main() async {
  await omamaCli.downloadModel("nomic-embed-text:latest");
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: globalTheme(),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
