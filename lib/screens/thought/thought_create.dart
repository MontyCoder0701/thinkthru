import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';

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
              _buildThoughtCreateField(
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
              _buildThoughtCreateField(
                title: 'Summary',
                onSaved: (v) => _thought.summary = v!,
                maxLines: 2,
              ),
              _buildThoughtCreateField(
                title: 'Pros',
                onSaved: (v) => _thought.pro = v!,
              ),
              _buildThoughtCreateField(
                title: 'Cons',
                onSaved: (v) => _thought.con = v!,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThoughtCreateField({
    required String title,
    void Function(String?)? onSaved,
    String? Function(String?)? validator,
    int maxLines = 5,
  }) {
    return Column(
      children: [
        ListTile(title: Text(title)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: TextFormField(
            validator: validator,
            keyboardType: TextInputType.multiline,
            maxLines: maxLines,
            onSaved: onSaved,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
