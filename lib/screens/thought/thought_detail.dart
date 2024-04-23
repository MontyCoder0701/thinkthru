import 'package:flutter/material.dart';

import '../../models/thought.dart';

class ThoughtDetailScreen extends StatefulWidget {
  final Thought thought;

  const ThoughtDetailScreen({
    required this.thought,
    super.key,
  });

  @override
  State<ThoughtDetailScreen> createState() => _ThoughtDetailScreenState();
}

class _ThoughtDetailScreenState extends State<ThoughtDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.thought.title),
        actions: [
          IconButton(
            onPressed: () => print('delete'),
            icon: Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () => print('edit'),
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Liked'),
            subtitle: Text('3 times'),
            trailing: Icon(Icons.favorite),
          ),
          _buildThoughtDetailField(
            title: 'Summary',
            initialValue: widget.thought.summary,
          ),
          _buildThoughtDetailField(
            title: 'Pros',
            initialValue: widget.thought.pro,
          ),
          _buildThoughtDetailField(
            title: 'Cons',
            initialValue: widget.thought.con,
          ),
        ],
      ),
    );
  }

  Widget _buildThoughtDetailField({
    required String title,
    required String initialValue,
  }) {
    return Column(
      children: [
        ListTile(title: Text(title)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: TextFormField(
            readOnly: true,
            initialValue: initialValue,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
          ),
        ),
      ],
    );
  }
}
