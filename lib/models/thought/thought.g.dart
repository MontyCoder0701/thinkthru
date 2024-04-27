// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thought.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Thought _$ThoughtFromJson(Map<String, dynamic> json) => Thought(
      title: json['title'] as String? ?? '',
      summary: json['summary'] as String? ?? '',
      pro: json['pro'] as String? ?? '',
      con: json['con'] as String? ?? '',
    )
      ..id = (json['id'] as num?)?.toInt()
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String)
      ..thoughtCount = (json['thoughtCount'] as num).toInt();

Map<String, dynamic> _$ThoughtToJson(Thought instance) => <String, dynamic>{
      'title': instance.title,
      'summary': instance.summary,
      'pro': instance.pro,
      'con': instance.con,
      'thoughtCount': instance.thoughtCount,
    };
