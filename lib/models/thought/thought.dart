import 'package:json_annotation/json_annotation.dart';

import '../base.dart';

part 'thought.g.dart';

@JsonSerializable()
class Thought extends BaseModel {
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

  factory Thought.fromJson(Map<String, dynamic> json) =>
      _$ThoughtFromJson(json);

  Map<String, dynamic> toJson() => _$ThoughtToJson(this);
}
