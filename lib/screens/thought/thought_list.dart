import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/thought.dart';
import 'thought_detail.dart';

class ThoughtListScreen extends StatefulWidget {
  const ThoughtListScreen({super.key});

  @override
  State<ThoughtListScreen> createState() => _ThoughtListScreenState();
}

class _ThoughtListScreenState extends State<ThoughtListScreen> {
  late final _thoughtList = context.select((ThoughtProvider i) => i.resources);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Thoughts'),
      ),
      body: ListView.builder(
        itemCount: _thoughtList.length,
        itemBuilder: (BuildContext context, int index) {
          final thought = _thoughtList[index];
          return ListTile(
            title: Text(thought.title),
            subtitle: Text(
              thought.summary,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text('1998.07.01'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ThoughtDetailScreen(),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Add new thought'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
