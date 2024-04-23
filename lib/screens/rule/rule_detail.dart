import 'package:flutter/material.dart';

import '../../models/rule.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.index.toString()),
        actions: [
          IconButton(
            onPressed: () => print('delete'),
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
