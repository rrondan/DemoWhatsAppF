import 'package:flutter/material.dart';

import 'chat_page.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('Chat $index'),
          subtitle: const Text('Último mensaje'),
          leading: const CircleAvatar(
            foregroundImage: AssetImage('images/person_placeholder.jpg'),
          ),
          trailing: const Text('Ayer'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
              return const ChatPage();
            }));
          },
        );
    });
  }
}
