import 'base.dart';

class Rule extends Base {
  int order;
  final String content;

  Rule({
    this.order = 0,
    required this.content,
  });
}
