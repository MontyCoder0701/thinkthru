import 'package:flutter/foundation.dart';
import 'package:thinkthru/repositories/local.dart';

import '../models/rule.dart';

class RuleProvider with ChangeNotifier {
  final databaseService = DatabaseService();
  List<Rule> _resources = [];

  List<Rule> get resources => _resources;

  Future<void> createOne(Rule rule) async {
    rule.createdAt = DateTime.now();
    final created = await databaseService.createOneRule(rule);
    _resources.add(rule..id = created.toString());
  }

  void deleteOne(Rule rule) {
    _resources.remove(rule);
    databaseService.deleteOneRule(rule.id!);
  }
}
