import 'package:flutter/foundation.dart';

import '../models/thought.dart';

class ThoughtProvider with ChangeNotifier {
  List<Thought> _resources = [
    Thought(
      title: 'First Thought',
      summary: 'Example summary',
      pro: 'this is the example pro',
      con: 'this is the example con',
    ),
    Thought(
      title: 'Second Thought',
      summary: 'Example summary',
      pro: 'this is the example pro',
      con: 'this is the example con',
    ),
  ];

  List<Thought> get resources => _resources;

  void createOne(Thought thought) {
    _resources.insert(0, thought);
  }

  void deleteOne(Thought thought) {
    _resources.remove(thought);
  }
}
