import 'package:flutter/foundation.dart';

import '../models/rule.dart';

class RuleProvider with ChangeNotifier {
  List<Rule> _resources = [
    Rule(content: 'This is the first rule example'),
    Rule(content: ' This is the second rule example'),
  ];

  List<Rule> get resources => _resources;

  void createOne(Rule rule) {
    _resources.add(rule);
  }
}
