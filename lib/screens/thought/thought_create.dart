import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';
import '../common/common.dart';

class ThoughtCreateScreen extends StatefulWidget {
  const ThoughtCreateScreen({super.key});

  @override
  State<ThoughtCreateScreen> createState() => _ThoughtCreateScreenState();
}

class _ThoughtCreateScreenState extends State<ThoughtCreateScreen> {
  late final _thoughtProvider = context.read<ThoughtProvider>();

  final _thought = Thought();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Thought'),
        actions: [
          IconButton(
            onPressed: () async {
              if (_key.currentState!.validate()) {
                _key.currentState!.save();
                await _thoughtProvider.createOne(_thought);

                if (context.mounted) {
                  Navigator.pop(context);
                }
              }
            },
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomInput(
                title: 'Title',
                maxLines: 1,
                onSaved: (v) => _thought.title = v!,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text for the title';
                  }
                  return null;
                },
              ),
              CustomInput(
                title: 'Summary',
                onSaved: (v) => _thought.summary = v!,
                maxLines: 2,
              ),
              CustomInput(
                title: 'Pros',
                onSaved: (v) => _thought.pro = v!,
              ),
              CustomInput(
                title: 'Cons',
                onSaved: (v) => _thought.con = v!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
