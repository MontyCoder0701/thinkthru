import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';
import 'thought_edit.dart';

class ThoughtDetailScreen extends StatefulWidget {
  final Thought thought;

  const ThoughtDetailScreen({
    required this.thought,
    super.key,
  });

  @override
  State<ThoughtDetailScreen> createState() => _ThoughtDetailScreenState();
}

class _ThoughtDetailScreenState extends State<ThoughtDetailScreen> {
  late final theme = Theme.of(context);
  late final _thoughtProvider = context.read<ThoughtProvider>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) => _thoughtProvider.updateOne(widget.thought),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.thought.title),
          actions: [
            IconButton(
              onPressed: () => _handleDialogOpen(),
              icon: const Icon(Icons.delete_outline),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThoughtEditScreen(
                      thought: widget.thought,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.edit_outlined),
            ),
          ],
        ),
        body: ListView(
          children: [
            ListTile(
              title: const Text('Thought through'),
              subtitle: Text('${widget.thought.thoughtCount} times'),
              trailing: IconButton(
                icon: Icon(
                  Icons.favorite_outline,
                  color: theme.colorScheme.primary,
                ),
                onPressed: () {
                  setState(() {
                    ++widget.thought.thoughtCount;
                  });
                },
              ),
            ),
            _buildThoughtDetailField(
              title: 'Summary',
              initialValue: widget.thought.summary,
              maxLines: 2,
            ),
            _buildThoughtDetailField(
              title: 'Pros',
              initialValue: widget.thought.pro,
            ),
            _buildThoughtDetailField(
              title: 'Cons',
              initialValue: widget.thought.con,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThoughtDetailField({
    required String title,
    required String initialValue,
    int maxLines = 5,
  }) {
    return Column(
      children: [
        ListTile(title: Text(title)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: TextFormField(
            readOnly: true,
            initialValue: initialValue,
            keyboardType: TextInputType.multiline,
            maxLines: maxLines,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }

  Future<void> _handleDialogOpen() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Thought?'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete this thought?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                _thoughtProvider.deleteOne(widget.thought);
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
