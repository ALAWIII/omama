import 'package:flutter/material.dart';
import 'package:omama/menus/cards/chat.dart';
import 'package:smooth_list_view/smooth_list_view.dart';

class ChatsHistoryScreen extends StatefulWidget {
  const ChatsHistoryScreen({super.key});

  @override
  State<ChatsHistoryScreen> createState() => _ChatsHistoryScreen();
}

class _ChatsHistoryScreen extends State<ChatsHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Chat History", style: TextStyle(color: Colors.white)),
        SizedBox(height: 30),
        Expanded(
          child: SmoothListView.builder(
            itemExtent: 50.0,
            padding: EdgeInsets.all(10),

            duration: Duration(seconds: 1),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: ChatCard(),
              );
            },
          ),
        ),
      ],
    );
  }
}
