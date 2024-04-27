import 'package:json_annotation/json_annotation.dart';

import 'base.dart';

part 'thought.g.dart';

@JsonSerializable()
class Thought extends Base {
  @JsonKey()
  String title;

  @JsonKey()
  String summary;

  @JsonKey()
  String pro;

  @JsonKey()
  String con;

  @JsonKey()
  int thoughtCount = 0;

  Thought({
    this.title = '',
    this.summary = '',
    this.pro = '',
    this.con = '',
  });
}
