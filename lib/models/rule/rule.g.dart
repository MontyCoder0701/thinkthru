// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rule _$RuleFromJson(Map<String, dynamic> json) => Rule(
      content: json['content'] as String,
    )
      ..id = (json['id'] as num?)?.toInt()
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String);

Map<String, dynamic> _$RuleToJson(Rule instance) => <String, dynamic>{
      'content': instance.content,
    };
