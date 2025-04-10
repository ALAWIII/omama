// represents the store where you will download the models from
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omama/cli_commands/data_model.dart';
import 'package:omama/global_states.dart';
import 'package:omama/menus/mod.dart';
import 'package:smooth_list_view/smooth_list_view.dart';

class ModelsStore extends ConsumerStatefulWidget {
  const ModelsStore({super.key});

  @override
  ConsumerState<ModelsStore> createState() => _ModelsStore();
}

class _ModelsStore extends ConsumerState<ModelsStore> {
  var textController = TextEditingController();

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
          onChanged: (v) {
            ref.read(modelSearchQueryProvider.notifier).state = v;
          },
        ),
        SizedBox(height: 30),
        Expanded(child: StoreScrollModel()),
      ],
    );
  }
}

class StoreScrollModel extends ConsumerStatefulWidget {
  const StoreScrollModel({super.key});
  @override
  ConsumerState<StoreScrollModel> createState() => _StoreScrollModel();
}

class _StoreScrollModel extends ConsumerState<StoreScrollModel> {
  var scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var modelsFiltered = ref.watch(filterStoreModelProvider);

    return SmoothListView.builder(
      controller: scrollController,
      addAutomaticKeepAlives: true,
      itemCount: modelsFiltered.length,
      duration: Duration(seconds: 1),
      itemBuilder: (context, index) {
        return StoreModelCard(model: modelsFiltered[index]);
      },
    );
  }
}
