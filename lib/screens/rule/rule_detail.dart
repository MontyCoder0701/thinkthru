import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';
import '../common/common.dart';
import 'rule_edit.dart';

class RuleDetailScreen extends StatefulWidget {
  final int index;
  final Rule rule;

  const RuleDetailScreen({
    required this.index,
    required this.rule,
    super.key,
  });

  @override
  State<RuleDetailScreen> createState() => _RuleDetailScreenState();
}

class _RuleDetailScreenState extends State<RuleDetailScreen> {
  late final _ruleProvider = context.read<RuleProvider>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((widget.index + 1).toString()),
        actions: [
          IconButton(
            onPressed: () => _handleDialogOpen(),
            icon: const Icon(Icons.delete_outline),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RuleEditScreen(
                    rule: widget.rule,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.edit_outlined),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(24.0),
            child: CustomInput(
              readOnly: true,
              initialValue: widget.rule.content,
              maxLines: 10,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleDialogOpen() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Rule?'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete this rule?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                _ruleProvider.deleteOne(widget.rule);
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
