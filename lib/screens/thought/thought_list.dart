import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/helpers.dart';
import '../../providers/thought.dart';
import 'thought_create.dart';
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
            trailing: Text(formatDate(thought.createdAt!)),
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ThoughtDetailScreen(
                    thought: thought,
                  ),
                ),
              );
              setState(() {
                /* thought updated or deleted */
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ThoughtCreateScreen(),
            ),
          );
          setState(() {
            /* rule created */
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
