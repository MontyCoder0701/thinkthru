import 'base.dart';

class Thought extends Base {
  String title;
  String summary;
  String pro;
  String con;
  final int likeCount = 0;

  Thought({
    this.title = '',
    this.summary = '',
    this.pro = '',
    this.con = '',
  });
}
