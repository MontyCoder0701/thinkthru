import 'package:flutter/material.dart';

class ThoughtDetailScreen extends StatefulWidget {
  const ThoughtDetailScreen({super.key});

  @override
  State<ThoughtDetailScreen> createState() => _ThoughtDetailScreenState();
}

class _ThoughtDetailScreenState extends State<ThoughtDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Title'),
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
            initialValue:
                'Hello, my name is Soo. Today I will be creating this application in Flutter. I love creating new things!',
          ),
          _buildThoughtDetailField(
            title: 'Pros',
            initialValue: 'This will have the pros of the thought',
          ),
          _buildThoughtDetailField(
            title: 'Cons',
            initialValue: 'This will have the cons of the thought',
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
