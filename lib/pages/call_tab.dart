import 'package:flutter/material.dart';

class CallTab extends StatelessWidget {
  const CallTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Llamada de $index'),
            subtitle: const Text('Ayer'),
            leading: const CircleAvatar(
              foregroundImage: AssetImage('images/person_placeholder.jpg'),
            ),
            trailing: const Icon(Icons.call, color: Colors.teal),
          );
        });
  }
}
