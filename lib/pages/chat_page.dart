import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsappf/model/message_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final messagesCollection = FirebaseFirestore.instance.collection('messages');

  final myName = 'Alumno Taller';
  final textController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat de prueba', style: TextStyle(fontSize: 18)),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.videocam)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.call)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: _listMessages()),
          _chatField(),
        ],
      ),
    );
  }
  
  Widget _listMessages(){
    return StreamBuilder<QuerySnapshot>(
      stream: messagesCollection.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        var list = snapshot.data!.docs.reversed.toList();
        return ListView.builder(
            itemCount: list.length,
            reverse: true,
            padding: const EdgeInsets.only(bottom: 8, top: 6),
            itemBuilder: (BuildContext context, index) {
              Map<String, dynamic> data = list[index].data()! as Map<String, dynamic>;
              var message = MessageChat.fromJson(data);
              return Align(
                alignment: message.name == myName ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: message.name == myName ? Colors.greenAccent : Colors.lightBlueAccent,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      message.name != myName ? Text(message.name, style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold
                      )) : const SizedBox(),
                      Text(message.message),
                    ],
                  ),
                ),
              );
            });
        });
  }

  Widget _chatField() {
    return Container(
      margin: const EdgeInsets.only(bottom: 4, left: 4, right: 4),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Mensaje',
                contentPadding: EdgeInsets.only(left: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          SizedBox(
            height: 48, width: 48,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: const CircleBorder()
              ),
              child: const Icon(Icons.send, color: Colors.white),
              onPressed: (){
                if(textController.text.trim().isNotEmpty) {
                  var messageChat = MessageChat(
                      message: textController.text, name: myName);
                  messagesCollection.add(messageChat.toJson())
                      .then((value) => print("Mensaje Agregado"))
                      .catchError((error) => print("Fallo al agregar mensaje: $error"));
                  /*setState(() {
                    messages.add(MessageChat(
                        message: textController.text, name: myName));
                    var list = messages.reversed.toList();
                    messages.clear();
                    messages.addAll(list);
                  });*/
                  textController.clear();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
