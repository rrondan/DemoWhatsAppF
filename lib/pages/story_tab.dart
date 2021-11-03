import 'package:flutter/material.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({Key? key}) : super(key: key);

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
              title: Text('Title $index'),
              subtitle: Text('Ayer'),
              leading: CircleAvatar(
                child: Text(index.toString()),
              ),
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
                title: Text('Title $index'),
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
