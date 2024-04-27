import 'package:flutter/foundation.dart';

import '../models/models.dart';
import '../repositories/thought.dart';

class ThoughtProvider with ChangeNotifier {
  final _repository = ThoughtRepository();
  List<Thought> _resources = [];

  List<Thought> get resources => _resources;

  Future<void> getMany() async {
    final result = await _repository.getMany();
    _resources = result;
    notifyListeners();
  }

  Future<void> createOne(Thought thought) async {
    final result = await _repository.createOne(thought);
    _resources.insert(0, result);
  }

  void deleteOne(Thought thought) {
    _repository.deleteOne(thought.id!);
    _resources.remove(thought);
  }

  void updateOne(Thought thought) {
    _repository.updateOne(thought);
  }
}
