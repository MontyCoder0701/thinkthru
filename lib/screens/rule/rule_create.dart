import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';
import '../common/common.dart';

class RuleCreateScreen extends StatefulWidget {
  const RuleCreateScreen({super.key});

  @override
  State<RuleCreateScreen> createState() => _RuleCreateScreenState();
}

class _RuleCreateScreenState extends State<RuleCreateScreen> {
  late final _ruleProvider = context.read<RuleProvider>();

  final _rule = Rule(content: '');
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Rule'),
        actions: [
          IconButton(
            onPressed: () async {
              if (_key.currentState!.validate()) {
                _key.currentState!.save();
                await _ruleProvider.createOne(_rule);

                if (context.mounted) {
                  Navigator.pop(context);
                }
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
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text for the rule';
                  }
                  return null;
                },
                maxLines: 10,
                onSaved: (v) => _rule.content = v!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
