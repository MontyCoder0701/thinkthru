import 'base.dart';

class Thought extends Base {
  String title;
  String summary;
  String pro;
  String con;
  int thoughtCount = 0;

  Thought({
    this.title = '',
    this.summary = '',
    this.pro = '',
    this.con = '',
  });
}
