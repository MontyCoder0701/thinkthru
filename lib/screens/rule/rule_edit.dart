import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';
import '../common/common.dart';

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
        title: const Text('Edit Rule'),
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
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _key,
              child: CustomInput(
                initialValue: widget.rule.content,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text for the rule';
                  }
                  return null;
                },
                maxLines: 10,
                onSaved: (v) => widget.rule.content = v!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
