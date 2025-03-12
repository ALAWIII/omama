import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omama/menus/models_card/local.dart';

class LocalModels extends ConsumerStatefulWidget {
  const LocalModels({super.key});

  @override
  ConsumerState<LocalModels> createState() => _LocalModels();
}

class _LocalModels extends ConsumerState<LocalModels> {
  var textController = TextEditingController();
  var scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Downloaded Models", style: TextStyle(color: Colors.white)),
        SizedBox(height: 30),
        TextField(
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
          controller: textController,
          decoration: InputDecoration(
            hintText: "search",
            hintStyle: TextStyle(color: Colors.white.withAlpha(150)),
          ),
        ),
        SizedBox(height: 30),
        Expanded(
          child: ListView.builder(
            controller: scrollController,
            itemCount: 50,
            itemBuilder: (BuildContext context, count) {
              return LocalModelCard(
                title: "deepSeek",
                summary: "best model ever",
                category: "Other",
                readme: "full details",
                varients: [("7b", "5GB")],
              );
            },
          ),
        ),
      ],
    );
  }
}
