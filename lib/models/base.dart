import 'package:json_annotation/json_annotation.dart';

abstract class BaseModel {
  @JsonKey(includeToJson: false)
  int? id;

  @JsonKey(includeToJson: false)
  DateTime? createdAt;
}
