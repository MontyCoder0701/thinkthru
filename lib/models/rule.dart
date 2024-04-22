import 'base.dart';

class Rule extends Base {
  int order;
  final String content;

  String get displayOrder => (order + 1).toString();

  Rule({
    this.order = 0,
    required this.content,
  });
}
