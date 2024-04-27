import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';

class RuleEditScreen extends StatefulWidget {
  final Rule rule;

  const RuleEditScreen({
    required this.rule,
    super.key,
  });

  @override
  State<RuleEditScreen> createState() => _RuleEditScreenState();
}

class _RuleEditScreenState extends State<RuleEditScreen> {
  late final _ruleProvider = context.read<RuleProvider>();

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Rule'),
        actions: [
          IconButton(
            onPressed: () {
              if (_key.currentState!.validate()) {
                _key.currentState!.save();
                _ruleProvider.updateOne(widget.rule);
                Navigator.pop(context);
                Navigator.pop(context);
              }
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(24.0),
            child: Form(
              key: _key,
              child: TextFormField(
                initialValue: widget.rule.content,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text for the rule';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                onSaved: (v) => widget.rule.content = v!,
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
