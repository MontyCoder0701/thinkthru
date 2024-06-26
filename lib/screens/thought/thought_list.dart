import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/helpers.dart';
import '../../providers/providers.dart';
import '../common/common.dart';
import 'thought_create.dart';
import 'thought_detail.dart';

class ThoughtListScreen extends StatefulWidget {
  const ThoughtListScreen({super.key});

  @override
  State<ThoughtListScreen> createState() => _ThoughtListScreenState();
}

class _ThoughtListScreenState extends State<ThoughtListScreen> {
  @override
  Widget build(BuildContext context) {
    final thoughtList = context.watch<ThoughtProvider>().resources;

    Widget buildBody() {
      if (thoughtList.isEmpty) {
        return const CustomEmpty(text: 'Create a New Thought!');
      }

      return ListView.builder(
        itemCount: thoughtList.length,
        itemBuilder: (BuildContext context, int index) {
          final thought = thoughtList[index];
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
      );
    }

    return Scaffold(
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ThoughtCreateScreen(),
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
