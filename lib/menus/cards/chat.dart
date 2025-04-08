import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_down_button/pull_down_button.dart';

class ChatCard extends ConsumerStatefulWidget {
  const ChatCard({super.key});

  @override
  ConsumerState<ChatCard> createState() => _ChatCard();
}

class _ChatCard extends ConsumerState<ChatCard> {
  String chatName = "new chat";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Expanded(
            child: TextButton(
              style: ButtonStyle(),
              onPressed: () {},
              child: Text(
                chatName,
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.clip,
                softWrap: true,
                maxLines: null,
              ),
            ),
          ),

          PullDownButton(
            itemBuilder:
                (context) => [
                  PullDownMenuItem(
                    title: "Rename",
                    onTap: () {},
                    iconWidget: Icon(Icons.edit),
                    iconColor: Colors.green,
                  ),

                  PullDownMenuItem(
                    title: "Details",
                    onTap: () {},
                    iconWidget: Icon(Icons.details),
                    iconColor: Colors.lightBlue,
                  ),
                  PullDownMenuItem(
                    title: "Delete",
                    onTap: () {},
                    iconWidget: Icon(Icons.delete),
                    iconColor: Colors.redAccent,
                  ),
                ],
            buttonBuilder:
                (context, showMenu) => ElevatedButton(
                  onPressed: showMenu,
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      CircleBorder(
                        side: BorderSide(color: Colors.grey.withAlpha(0)),
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all(
                      Colors.white.withAlpha(20),
                    ),
                  ),
                  child: Text("...", style: TextStyle(color: Colors.white)),
                ),
          ),
        ],
      ),
    );
  }
}
