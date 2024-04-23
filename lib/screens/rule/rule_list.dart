import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/rule.dart';
import 'rule_detail.dart';

class RuleListScreen extends StatefulWidget {
  const RuleListScreen({super.key});

  @override
  State<RuleListScreen> createState() => _RuleListScreenState();
}

class _RuleListScreenState extends State<RuleListScreen> {
  late final _ruleList = context.select((RuleProvider i) => i.resources);

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

            final rule = _ruleList.removeAt(oldIndex);
            _ruleList.insert(newIndex, rule);
          });
        },
        itemCount: _ruleList.length,
        itemBuilder: (BuildContext context, int index) {
          final rule = _ruleList[index];
          return ListTile(
            key: Key(index.toString()),
            leading: Text((index + 1).toString()),
            title: Text(
              rule.content,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RuleDetailScreen(
                    index: index,
                    rule: rule,
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
