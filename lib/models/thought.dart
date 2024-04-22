import 'base.dart';

class Thought extends Base {
  final String title;
  final String summary;
  final String pro;
  final String con;
  final int likeCount = 0;

  Thought({
    required this.title,
    this.summary = '',
    this.pro = '',
    this.con = '',
  });
}
