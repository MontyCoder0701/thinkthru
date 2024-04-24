import 'package:flutter/foundation.dart';

import '../models/rule.dart';

class RuleProvider with ChangeNotifier {
  List<Rule> _resources = [];

  List<Rule> get resources => _resources;

  void createOne(Rule rule) {
    rule.createdAt = DateTime.now();
    _resources.add(rule);
  }

  void deleteOne(Rule rule) {
    _resources.remove(rule);
  }
}
