import 'package:flutter/material.dart';
import 'package:whatsappf/pages/story_content.dart';

class StoryTab extends StatelessWidget {
  const StoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(left: 16, top: 16),
            child: const Text('Recientes',
              style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
            return ListTile(
              title: Text('Estado $index'),
              subtitle: Text('Ayer'),
              leading: CircleAvatar(
                foregroundImage: AssetImage('images/person_placeholder.jpg'),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => const StoryContent()));
              },
            );
          }, childCount: 6)),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(left: 16, top: 8),
            child: const Text('Vistos',
              style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return ListTile(
                title: Text('Estado $index'),
                subtitle: Text('Ayer'),
                leading: CircleAvatar(
                  child: Text(index.toString()),
                ),
              );
            }, childCount: 6)),
      ],
    );
  }
}
