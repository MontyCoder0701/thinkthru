import 'package:flutter/material.dart';

class RuleListScreen extends StatefulWidget {
  const RuleListScreen({super.key});

  @override
  State<RuleListScreen> createState() => _RuleListScreenState();
}

class _RuleListScreenState extends State<RuleListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Rules'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Text('1'),
            title: Text(
              'This will display the rule you have set for yourself regarding decision making and thought processes.',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Add new rule'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
