// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_moment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiMoment _$ApiMomentFromJson(Map<String, dynamic> json) => ApiMoment(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      videoPath: json['video_path'] as String,
      created: DateTime.parse(json['created'] as String),
      updated: DateTime.parse(json['updated'] as String),
      mentalHealth: json['mental_health'] as bool,
      physicalHealth: json['physical_health'] as bool,
      fulfillment: json['fulfillment'] as bool,
      awareness: json['awareness'] as bool,
      joy: json['joy'] as bool,
      habit: json['habit'] as bool,
      goal: json['goal'] as bool,
      improvement: json['improvement'] as bool,
      discovering: json['discovering'] as bool,
      relationship: json['relationship'] as bool,
    );

Map<String, dynamic> _$ApiMomentToJson(ApiMoment instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'video_path': instance.videoPath,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
      'mental_health': instance.mentalHealth,
      'physical_health': instance.physicalHealth,
      'fulfillment': instance.fulfillment,
      'awareness': instance.awareness,
      'joy': instance.joy,
      'habit': instance.habit,
      'goal': instance.goal,
      'improvement': instance.improvement,
      'discovering': instance.discovering,
      'relationship': instance.relationship,
    };
