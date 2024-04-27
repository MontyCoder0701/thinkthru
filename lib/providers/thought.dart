import 'package:flutter/foundation.dart';

import '../models/models.dart';

class ThoughtProvider with ChangeNotifier {
  List<Thought> _resources = [];

  List<Thought> get resources => _resources;

  void createOne(Thought thought) {
    thought.createdAt = DateTime.now();
    _resources.insert(0, thought);
  }

  void deleteOne(Thought thought) {
    _resources.remove(thought);
  }
}
