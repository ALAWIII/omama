import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omama/main_screen_components/bar.dart';
import 'package:omama/menus/mod.dart';

class SideMenu extends ConsumerStatefulWidget {
  const SideMenu({super.key});

  @override
  ConsumerState<SideMenu> createState() => _SideMenu();
}

class _SideMenu extends ConsumerState<SideMenu> {
  @override
  Widget build(BuildContext context) {
    var showSideMenu = ref.watch(sideMenu);
    var modelDetWatch = ref.watch(modelDetails);

    return showSideMenu != null
        ? menuScreen(context, showSideMenu, modelDetWatch)
        : SizedBox.shrink(); //I don't want to repaint or rebuild anything!!
  }

  //-------------------------------------
  Widget menuScreen(
    BuildContext context,
    MenuBarModels menuBar,
    ModelDetalis? mDetailsWatch,
  ) {
    return Container(
      padding: EdgeInsets.all(30),
      width: 430,

      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.blueGrey.shade600,
          strokeAlign: 5,
          width: 1,
        ),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: Border.symmetric(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: mDetailsWatch ?? _getCurrentMenu(menuBar.name)),
    );
  }

  Widget? _getCurrentMenu(String menuName) {
    return switch (menuName) {
      "chats" => ChatsHistoryMenu(),
      "localModels" => LocalModels(),
      "modelsStore" => ModelsStore(),
      "settings" => Settings(),
      "acknowledgement" => Acknowledgement(),
      _ => null,
    };
  }
}
