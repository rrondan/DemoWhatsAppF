import 'package:flutter/material.dart';
import 'package:whatsappf/pages/call_tab.dart';
import 'package:whatsappf/pages/chat_tab.dart';
import 'package:whatsappf/pages/story_tab.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('WhatsApp - Flutter'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'CHATS'),
              Tab(text: 'ESTADOS'),
              Tab(text: 'LLAMADAS'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ChatTab(),
            StoryTab(),
            CallTab()
          ],
        ),
      ),
    );
  }
}
