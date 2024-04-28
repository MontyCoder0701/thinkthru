import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';
import '../common/common.dart';
import 'rule_create.dart';
import 'rule_detail.dart';

class RuleListScreen extends StatefulWidget {
  const RuleListScreen({super.key});

  @override
  State<RuleListScreen> createState() => _RuleListScreenState();
}

class _RuleListScreenState extends State<RuleListScreen> {
  late final RuleProvider _ruleProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _ruleProvider = context.read<RuleProvider>();
      _ruleProvider.getMany();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ruleList = context.watch<RuleProvider>().resources;

    Widget buildBody() {
      if (ruleList.isEmpty) {
        return CustomEmpty(text: 'Create a New Rule!');
      }

      return ReorderableListView.builder(
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }

            _ruleProvider.reorder(oldIndex, newIndex);
          });
        },
        itemCount: ruleList.length,
        itemBuilder: (BuildContext context, int index) {
          final rule = ruleList[index];
          return ListTile(
            key: Key(index.toString()),
            leading: Text((index + 1).toString()),
            title: Text(
              rule.content,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Icon(Icons.drag_handle_outlined),
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
      );
    }

    return Scaffold(
      body: buildBody(),
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
