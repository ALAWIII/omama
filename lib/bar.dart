import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omama/menus/models_card/model_detalis.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

StateProvider<MenuBarModels?> sideMenu = StateProvider((ref) {
  return null;
});
StateProvider<int?> _selectedIndex = StateProvider((ref) {
  return null;
});

enum MenuBarModels {
  chats,
  localModels,
  modelsStore,
  settings,
  acknowledgement,
}

class BarScreenButtons extends ConsumerStatefulWidget {
  const BarScreenButtons({super.key});
  @override
  ConsumerState<BarScreenButtons> createState() => _BarScreenButtonsState();
}

class _BarScreenButtonsState extends ConsumerState<BarScreenButtons> {
  final _selectedColor = Colors.lightBlueAccent;

  @override
  Widget build(BuildContext context) {
    final sideMenuRead = ref.read(sideMenu.notifier);
    final modDet = ref.read(modelDetails.notifier);
    final readIndex = ref.read(_selectedIndex.notifier);

    return Container(
      color: Colors.grey.withAlpha(50),
      child: Column(
        spacing: 20.0,
        children: [
          IconButton(
            color: readIndex.state == 0 ? _selectedColor : null,
            icon: Icon(FluentIcons.reading_list_24_regular),
            onPressed: () {
              sideMenuRead.state =
                  sideMenuRead.state != MenuBarModels.chats
                      ? MenuBarModels.chats
                      : null;

              readIndex.state = readIndex.state != 0 ? 0 : null;
            },
          ),
          IconButton(
            color: readIndex.state == 1 ? _selectedColor : null,
            icon: Icon(Icons.download_done),
            onPressed: () {
              sideMenuRead.state =
                  sideMenuRead.state != MenuBarModels.localModels
                      ? MenuBarModels.localModels
                      : null;
              if (modDet.state != null) {
                modDet.state = null;
              }
              readIndex.state = readIndex.state != 1 ? 1 : null;
            },
          ),
          IconButton(
            icon: Icon(Icons.storefront_outlined),
            color: readIndex.state == 2 ? _selectedColor : null,
            onPressed: () {
              sideMenuRead.state =
                  sideMenuRead.state != MenuBarModels.modelsStore
                      ? MenuBarModels.modelsStore
                      : null;
              readIndex.state = readIndex.state != 2 ? 2 : null;
            },
          ),
          Expanded(
            child: Column(
              spacing: 20.0,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  color: readIndex.state == 3 ? _selectedColor : null,
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    sideMenuRead.state =
                        sideMenuRead.state != MenuBarModels.settings
                            ? MenuBarModels.settings
                            : null;
                    readIndex.state = readIndex.state != 3 ? 3 : null;
                  },
                ),
                IconButton(
                  icon: Icon(Icons.help_outline),
                  color: readIndex.state == 4 ? _selectedColor : null,
                  onPressed: () {
                    sideMenuRead.state =
                        sideMenuRead.state != MenuBarModels.acknowledgement
                            ? MenuBarModels.acknowledgement
                            : null;
                    readIndex.state = readIndex.state != 4 ? 4 : null;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
