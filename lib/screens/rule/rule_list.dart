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
    Rule(order: 0, content: 'This is the first rule example'),
    Rule(order: 1, content: ' This is the second rule example'),
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

            final oldItem = _items.elementAt(oldIndex);
            final newItem = _items.elementAt(newIndex);

            oldItem.order = newIndex;
            newItem.order = oldIndex;

            final item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          });
        },
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          final Rule item = _items[index];
          return ListTile(
            key: Key('${item.displayOrder}'),
            leading: Text('${item.displayOrder}'),
            title: Text(
              item.content,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RuleDetailScreen(rule: item),
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
