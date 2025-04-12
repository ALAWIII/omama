import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omama/cli_commands/data_model.dart';
import 'package:omama/global_states.dart';
import 'package:pull_down_button/pull_down_button.dart';

class ChatCard extends ConsumerStatefulWidget {
  final OChat chat;
  const ChatCard({super.key, required this.chat});

  @override
  ConsumerState<ChatCard> createState() => _ChatCard();
}

class _ChatCard extends ConsumerState<ChatCard> {
  String chatName = "new chat";

  @override
  Widget build(BuildContext context) {
    var chatMessages = ref.read(allMessagesProvider.notifier);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Expanded(
            child: TextButton(
              style: ButtonStyle(),
              onPressed:
                  ref.watch(dbLock)
                      ? () {
                        ref.read(chatId.notifier).state = widget.chat.id;
                        omamaCli.getAllMessages(
                          widget.chat.id,
                          chatMessages,
                          ref.read(dbLock.notifier),
                        );
                      }
                      : null,
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
                  PullDownMenuItem(
                    title: "id : ${widget.chat.id}",
                    onTap: null,
                    iconWidget: Icon(Icons.info),
                    iconColor: Colors.white,
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
