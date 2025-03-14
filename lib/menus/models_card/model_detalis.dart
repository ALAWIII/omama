import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:omama/menus/mod.dart';

StateProvider<ModelDetalis?> modelDetails = StateProvider((ref) => null);

class ModelDetalis extends ConsumerStatefulWidget {
  final String name;
  final String summary;
  final String readme;

  const ModelDetalis({
    super.key,
    required this.name,
    required this.summary,
    required this.readme,
  });
  @override
  ConsumerState<ModelDetalis> createState() => _ModelDetails();
}

class _ModelDetails extends ConsumerState<ModelDetalis> {
  @override
  Widget build(BuildContext context) {
    var scrollReadme = ScrollController();
    var mdetails = ref.read(modelDetails.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              style: ButtonStyle(
                iconColor: WidgetStateProperty.all(Colors.yellow),
              ),
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                mdetails.state = null;
              },
            ),
            Spacer(),
            Text(
              widget.name,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: 20),
        Text(widget.summary, style: TextStyle(color: Colors.white)),
        SizedBox(height: 30),

        Expanded(
          child: SingleChildScrollView(
            controller: scrollReadme,

            child: MarkdownBlock(
              data: widget.readme,
              config: MarkdownConfig.darkConfig,
            ),
          ),
        ),
      ],
    );
  }
}
