import 'package:flutter/material.dart';

import '../../models/models.dart';

class ThoughtEditScreen extends StatefulWidget {
  final Thought thought;

  const ThoughtEditScreen({
    required this.thought,
    super.key,
  });

  @override
  State<ThoughtEditScreen> createState() => _ThoughtEditScreenState();
}

class _ThoughtEditScreenState extends State<ThoughtEditScreen> {
  late final theme = Theme.of(context);
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Thought'),
        actions: [
          IconButton(
            onPressed: () {
              if (_key.currentState!.validate()) {
                _key.currentState!.save();
                Navigator.pop(context);
                Navigator.pop(context);
              }
            },
            icon: Icon(Icons.done),
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
                initialValue: widget.thought.title,
                onSaved: (v) => widget.thought.title = v!,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text for the title';
                  }
                  return null;
                },
              ),
              _buildThoughtCreateField(
                title: 'Summary',
                initialValue: widget.thought.summary,
                onSaved: (v) => widget.thought.summary = v!,
              ),
              _buildThoughtCreateField(
                title: 'Pros',
                initialValue: widget.thought.pro,
                onSaved: (v) => widget.thought.pro = v!,
              ),
              _buildThoughtCreateField(
                title: 'Cons',
                initialValue: widget.thought.con,
                onSaved: (v) => widget.thought.con = v!,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThoughtCreateField({
    required String title,
    required String initialValue,
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
            initialValue: initialValue,
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
