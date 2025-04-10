import 'package:flutter/material.dart';
import 'package:markdown_widget/config/configs.dart';
import 'package:markdown_widget/widget/markdown_block.dart';

class MRBox extends StatelessWidget {
  final String message;
  final bool isResponse;
  const MRBox({super.key, required this.message, required this.isResponse});
  @override
  Widget build(BuildContext contex) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: !isResponse ? Colors.lightBlueAccent : Colors.black,
        ),
        color: Colors.black.withAlpha(5),
      ),
      child: MarkdownBlock(data: message, config: MarkdownConfig.darkConfig),
    );
  }
}
