import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../common/common.dart';

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
        title: const Text('Edit Thought'),
        actions: [
          IconButton(
            onPressed: () {
              if (_key.currentState!.validate()) {
                _key.currentState!.save();
                Navigator.pop(context);
                Navigator.pop(context);
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
                initialValue: widget.thought.title,
                onSaved: (v) => widget.thought.title = v!,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text for the title';
                  }
                  return null;
                },
              ),
              CustomInput(
                title: 'Summary',
                maxLines: 2,
                initialValue: widget.thought.summary,
                onSaved: (v) => widget.thought.summary = v!,
              ),
              CustomInput(
                title: 'Pros',
                initialValue: widget.thought.pro,
                onSaved: (v) => widget.thought.pro = v!,
              ),
              CustomInput(
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
}
