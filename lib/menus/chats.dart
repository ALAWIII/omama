import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omama/cli_commands/data_model.dart';
import 'package:omama/global_states.dart';

import 'package:omama/menus/cards/chat.dart';
import 'package:smooth_list_view/smooth_list_view.dart';

class ChatsHistoryMenu extends StatefulWidget {
  const ChatsHistoryMenu({super.key});

  @override
  State<ChatsHistoryMenu> createState() => _ChatsHistoryMenu();
}

class _ChatsHistoryMenu extends State<ChatsHistoryMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Chat History", style: TextStyle(color: Colors.white)),
        SizedBox(height: 30),
        Expanded(child: ChatsScrollHistory()),
      ],
    );
  }
}

class ChatsScrollHistory extends ConsumerStatefulWidget {
  const ChatsScrollHistory({super.key});

  @override
  ConsumerState<ChatsScrollHistory> createState() => _ChatsScroll();
}

class _ChatsScroll extends ConsumerState<ChatsScrollHistory> {
  @override
  Widget build(BuildContext context) {
    List<OChat> chatsHistory = ref.watch(chatsProvider)!;

    return SmoothListView.builder(
      itemExtent: 50.0,
      padding: EdgeInsets.all(5),

      duration: Duration(seconds: 1),
      itemCount: chatsHistory.length,
      itemBuilder: (context, index) {
        var chat = chatsHistory[chatsHistory.length - 1 - index];
        return Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: ChatCard(chat: chat),
        );
      },
    );
  }
}
