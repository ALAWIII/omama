import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_list_view/smooth_list_view.dart';

class ChatList extends ConsumerStatefulWidget {
  const ChatList({super.key});

  @override
  ConsumerState<ChatList> createState() => _ChatList();
}

class _ChatList extends ConsumerState<ChatList> {
  final scrollChats = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SmoothListView.builder(
        duration: Duration(seconds: 1),
        itemCount: 10,
        controller: scrollChats,
        itemBuilder: (BuildContext context, index) {
          return Placeholder();
        },
      ),
    );
  }
}

class Chat extends ConsumerWidget {
  final textController = TextEditingController();
  Chat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: ChatList()),
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: LayoutBuilder(
            builder: (context, constraints) {
              double textFieldWidth =
                  constraints.maxWidth * 0.8; // 80% of available width
              double textFieldHeight =
                  constraints.maxHeight * 0.1; // 10% of available height

              return Center(
                child: Container(
                  width: 650,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withAlpha(50),
                    border: Border.all(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: textFieldWidth.clamp(
                          200,
                          600,
                        ), // Minimum 200, max 600
                        height: textFieldHeight.clamp(
                          50,
                          80,
                        ), // Minimum 50, max 100
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          controller: textController,
                          expands: true,
                          maxLines: null,
                          textAlignVertical: TextAlignVertical.center,

                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            hintStyle: const TextStyle(color: Colors.grey),

                            hintText: "Ask Anything",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.lightBlueAccent,
                          ),
                        ),
                        icon: Icon(Icons.arrow_upward),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
