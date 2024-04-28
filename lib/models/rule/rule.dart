import 'package:json_annotation/json_annotation.dart';

import '../base.dart';

part 'rule.g.dart';

@JsonSerializable()
class Rule extends BaseModel {
  @JsonKey()
  int order = 0;

  @JsonKey()
  String content;

  Rule({required this.content});

  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);

  Map<String, dynamic> toJson() => _$RuleToJson(this);
}
