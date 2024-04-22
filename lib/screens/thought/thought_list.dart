import 'package:flutter/material.dart';

class ThoughtListScreen extends StatefulWidget {
  const ThoughtListScreen({super.key});

  @override
  State<ThoughtListScreen> createState() => _ThoughtListScreenState();
}

class _ThoughtListScreenState extends State<ThoughtListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Thoughts'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Example Title'),
            subtitle: Text(
              'Hello, my name is Soo. Today I will be creating this application in Flutter. I love creating new things!',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text('1998.07.01'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Add new thought'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
