import 'package:flutter/material.dart';

class RuleDetailScreen extends StatefulWidget {
  const RuleDetailScreen({super.key});

  @override
  State<RuleDetailScreen> createState() => _RuleDetailScreenState();
}

class _RuleDetailScreenState extends State<RuleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1'),
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
              initialValue:
                  'This will display the rule you have set for yourself regarding decision making and thought processes.',
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
