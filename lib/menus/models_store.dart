// represents the store where you will download the models from
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omama/menus/mod.dart';
import 'package:smooth_list_view/smooth_list_view.dart';

class ModelsStore extends ConsumerStatefulWidget {
  const ModelsStore({super.key});

  @override
  ConsumerState<ModelsStore> createState() => _ModelsStore();
}

class _ModelsStore extends ConsumerState<ModelsStore> {
  var textController = TextEditingController();
  var scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Models Store", style: TextStyle(color: Colors.white)),
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
          child: SmoothListView.builder(
            duration: Duration(seconds: 1),
            controller: scrollController,
            itemCount: 50,
            itemBuilder: (BuildContext context, count) {
              return StoreModelCard(
                name: "deepSeek",
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
