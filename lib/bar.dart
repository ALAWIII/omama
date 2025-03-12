import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

StateProvider<MenuBar?> sideMenu = StateProvider((ref) {
  return null;
});
StateProvider<int?> _selectedIndex = StateProvider((ref) {
  return null;
});

enum MenuBar { chats, localModels, modelsStore, settings, acknowledgement }

class BarScreenButtons extends ConsumerWidget {
  const BarScreenButtons({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _BarScreenButtonsState();
  }
}

class _BarScreenButtonsState extends ConsumerWidget {
  const _BarScreenButtonsState();
  final _selectedColor = Colors.lightBlueAccent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sideMenuRead = ref.read(sideMenu.notifier);
    final readIndex = ref.read(_selectedIndex.notifier);

    return Container(
      color: Colors.grey.withAlpha(50),
      child: Column(
        spacing: 20.0,
        children: [
          IconButton(
            color: readIndex.state == 0 ? _selectedColor : null,
            icon: Icon(Icons.menu),
            onPressed: () {
              sideMenuRead.state =
                  sideMenuRead.state != MenuBar.chats ? MenuBar.chats : null;
              readIndex.state = readIndex.state != 0 ? 0 : null;
            },
          ),
          IconButton(
            color: readIndex.state == 1 ? _selectedColor : null,
            icon: Icon(Icons.download_outlined),
            onPressed: () {
              sideMenuRead.state =
                  sideMenuRead.state != MenuBar.localModels
                      ? MenuBar.localModels
                      : null;
              readIndex.state = readIndex.state != 1 ? 1 : null;
            },
          ),
          IconButton(
            icon: Icon(Icons.storefront_outlined),
            color: readIndex.state == 2 ? _selectedColor : null,
            onPressed: () {
              sideMenuRead.state =
                  sideMenuRead.state != MenuBar.modelsStore
                      ? MenuBar.modelsStore
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
                        sideMenuRead.state != MenuBar.settings
                            ? MenuBar.settings
                            : null;
                    readIndex.state = readIndex.state != 3 ? 3 : null;
                  },
                ),
                IconButton(
                  icon: Icon(Icons.help_outline),
                  color: readIndex.state == 4 ? _selectedColor : null,
                  onPressed: () {
                    sideMenuRead.state =
                        sideMenuRead.state != MenuBar.acknowledgement
                            ? MenuBar.acknowledgement
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
