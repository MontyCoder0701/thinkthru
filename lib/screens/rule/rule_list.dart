import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/rule.dart';
import 'rule_create.dart';
import 'rule_detail.dart';

class RuleListScreen extends StatefulWidget {
  const RuleListScreen({super.key});

  @override
  State<RuleListScreen> createState() => _RuleListScreenState();
}

class _RuleListScreenState extends State<RuleListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final _ruleProvider = context.read<RuleProvider>();
      _ruleProvider.getMany();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _ruleList = context.watch<RuleProvider>().resources;

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
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RuleDetailScreen(
                    index: index,
                    rule: rule,
                  ),
                ),
              );
              setState(() {
                /* rule updated or deleted */
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
              builder: (context) => RuleCreateScreen(),
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
