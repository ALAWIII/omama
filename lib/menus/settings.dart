// includes all settings for chatting like top-p , top-k ,etc.. .

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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.deepOrange),
              ),
              child: Text("reset", style: TextStyle(color: Colors.white)),
              onPressed: () {},
            ),
            Spacer(),

            Text("Settings", style: TextStyle(color: Colors.white)),
            Spacer(),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.green),
              ),
              child: Text("save", style: TextStyle(color: Colors.white)),
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            controller: scrollSettings,
            child: Column(children: []),
          ),
        ),
      ],
    );
  }
}
