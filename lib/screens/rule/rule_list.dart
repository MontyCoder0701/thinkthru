import 'package:flutter/material.dart';

import '/models/rule.dart';
import 'rule_detail.dart';

class RuleListScreen extends StatefulWidget {
  const RuleListScreen({super.key});

  @override
  State<RuleListScreen> createState() => _RuleListScreenState();
}

class _RuleListScreenState extends State<RuleListScreen> {
  final List<Rule> _items = [
    Rule(content: 'This is the first rule example'),
    Rule(content: ' This is the second rule example'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Rules'),
      ),
      body: ReorderableListView.builder(
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }

            final item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          });
        },
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          final Rule item = _items[index];
          return ListTile(
            key: Key(index.toString()),
            leading: Text((index + 1).toString()),
            title: Text(
              item.content,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RuleDetailScreen(
                    index: index,
                    rule: item,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Add new rule'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
