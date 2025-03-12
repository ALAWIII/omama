import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'global_theme.dart';
import "screens/home.dart";

Future<void> main() async {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: global_theme(),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
