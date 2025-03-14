import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});
  @override
  ConsumerState<Settings> createState() => _Settings();
}

class _Settings extends ConsumerState<Settings> {
  final scrollSettings = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        controller: scrollSettings,
        child: Column(children: []),
      ),
    );
  }
}
