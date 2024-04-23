import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/rule.dart';
import '../../providers/rule.dart';

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
            onPressed: () {
              _ruleProvider.deleteOne(widget.rule);
              Navigator.pop(context);
            },
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
          Container(
            padding: EdgeInsets.all(24.0),
            child: TextFormField(
              readOnly: true,
              initialValue: widget.rule.content,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
            ),
          ),
        ],
      ),
    );
  }
}
