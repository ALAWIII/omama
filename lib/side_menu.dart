import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    if (showSideMenu == null)
      return SizedBox.shrink(); //I don't want to repaint or rebuild anything!!

    return Container(
      padding: EdgeInsets.all(30),
      width: 400,

      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: Colors.lightBlueAccent,
          strokeAlign: 5,
          width: 1,
        ),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: Border.symmetric(),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: switch (showSideMenu.name) {
          "chats" => Placeholder(),
          "localModels" => LocalModels(),
          "modelsStore" => ModelsStore(),
          "settings" => Placeholder(),
          "acknowledgement" => Acknowledgement(),
          _ => null,
        },
      ),
    );
  }
}
