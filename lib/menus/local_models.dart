// represents the menu that views local downloaded models

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omama/global_states.dart';
import 'package:omama/menus/mod.dart';
import 'package:smooth_list_view/smooth_list_view.dart';

class LocalModels extends ConsumerStatefulWidget {
  const LocalModels({super.key});

  @override
  ConsumerState<LocalModels> createState() => _LocalModels();
}

class _LocalModels extends ConsumerState<LocalModels> {
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //var scrollController = ScrollController();

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
        Expanded(child: LocalScrollModels()),
      ],
    );
  }
}

class LocalScrollModels extends ConsumerStatefulWidget {
  const LocalScrollModels({super.key});

  @override
  ConsumerState<LocalScrollModels> createState() => _LocalScrollModels();
}

class _LocalScrollModels extends ConsumerState<LocalScrollModels> {
  var scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var localModelAsync = ref.watch(localModelsProvider);

    return localModelAsync.when(
      data:
          (models) => SmoothListView.builder(
            controller: scrollController,
            duration: Duration(seconds: 1),
            itemCount: models.length,
            itemBuilder: (BuildContext context, count) {
              return LocalModelCard(model: models[count]);
            },
          ),
      loading: () => CircularProgressIndicator(),
      error: (e, st) => Text('Error: $e'),
    );
  }
}
