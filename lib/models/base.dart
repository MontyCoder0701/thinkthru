import 'package:json_annotation/json_annotation.dart';

abstract class BaseModel {
  @JsonKey(includeToJson: false)
  int? id;

  @JsonKey(name: 'created_at', includeToJson: false)
  DateTime? createdAt;
}
