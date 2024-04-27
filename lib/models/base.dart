import 'package:json_annotation/json_annotation.dart';

abstract class Base {
  @JsonKey(includeToJson: false)
  String? id;

  @JsonKey(includeToJson: false)
  DateTime? createdAt;
}
