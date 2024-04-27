import 'package:flutter/foundation.dart';
import 'package:thinkthru/repositories/local.dart';

import '../models/rule.dart';

class RuleProvider with ChangeNotifier {
  final databaseService = DatabaseService();
  List<Rule> _resources = [];

  List<Rule> get resources => _resources;

  Future<void> getMany() async {
    final result = await databaseService.getManyRule();
    _resources = result;
    notifyListeners();
  }

  Future<void> createOne(Rule rule) async {
    rule.createdAt = DateTime.now();
    final result = await databaseService.createOneRule(rule);
    _resources.add(rule..id = result);
  }

  void deleteOne(Rule rule) {
    _resources.remove(rule);
    databaseService.deleteOneRule(rule.id!);
  }
}
