import 'package:flutter/material.dart';

class ThoughtListScreen extends StatefulWidget {
  const ThoughtListScreen({super.key});

  @override
  State<ThoughtListScreen> createState() => _ThoughtListScreenState();
}

class _ThoughtListScreenState extends State<ThoughtListScreen> {
  @override
  Widget build(BuildContext context) {
    late final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primaryContainer,
        title: Text('My Thoughts'),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Title'),
            subtitle: Text('Preview Text'),
            trailing: Text('Date'),
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
