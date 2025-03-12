import 'package:flutter/material.dart';

class Acknowledgement extends StatelessWidget {
  const Acknowledgement({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Acknowledgement", style: TextStyle(color: Colors.white)),
        Spacer(),
        Text(
          textAlign: TextAlign.center,
          "Copyright © 2025 Omama Corporation.\n All rights reserved.",
          style: TextStyle(
            overflow: TextOverflow.clip,
            color: Colors.white,

            fontSize: 15,
            fontWeight: FontWeight.bold,
            shadows: [Shadow(color: Colors.grey, blurRadius: 10.0)],
          ),
        ),
        Spacer(),
      ],
    );
  }
}
