import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../providers/thought.dart';

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
        title: Text('Create New Thought'),
        actions: [
          IconButton(
            onPressed: () {
              if (_key.currentState!.validate()) {
                _key.currentState!.save();
                _thoughtProvider.createOne(_thought);
                Navigator.pop(context);
              }
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Form(
        key: _key,
        child: ListView(
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
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: validator,
            keyboardType: TextInputType.multiline,
            maxLines: maxLines,
            onSaved: onSaved,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
          ),
        ),
      ],
    );
  }
}