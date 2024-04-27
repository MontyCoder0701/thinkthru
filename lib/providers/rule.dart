import 'package:flutter/foundation.dart';

import '../models/models.dart';
import '../repositories/rule.dart';

class RuleProvider with ChangeNotifier {
  final _repository = RuleRepository();
  List<Rule> _resources = [];

  List<Rule> get resources => _resources;

  Future<void> getMany() async {
    final result = await _repository.getMany();
    _resources = result;
    notifyListeners();
  }

  Future<void> createOne(Rule rule) async {
    final result = await _repository.createOne(rule);
    _resources.add(result);
  }

  void deleteOne(Rule rule) {
    _resources.remove(rule);
    _repository.deleteOne(rule.id!);
  }

  void updateOne(Rule rule) {
    _repository.updateOne(rule);
  }
}
