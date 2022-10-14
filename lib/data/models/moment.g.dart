// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Moment _$MomentFromJson(Map<String, dynamic> json) => Moment(
      apiId: json['api_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      videoPath: json['video_path'] as String,
      dateTime: DateTime.parse(json['date_time'] as String),
      favourite: Moment._boolFromInt(json['favourite'] as int?),
      mentalHealth: Moment._boolFromInt(json['mental_health'] as int?),
      fulfillment: Moment._boolFromInt(json['fulfillment'] as int?),
      awareness: Moment._boolFromInt(json['awareness'] as int?),
      joy: Moment._boolFromInt(json['joy'] as int?),
      habit: Moment._boolFromInt(json['habit'] as int?),
      goal: Moment._boolFromInt(json['goal'] as int?),
      improvement: Moment._boolFromInt(json['improvement'] as int?),
      discovering: Moment._boolFromInt(json['discovering'] as int?),
      relationship: Moment._boolFromInt(json['relationship'] as int?),
    );

Map<String, dynamic> _$MomentToJson(Moment instance) => <String, dynamic>{
      'api_id': instance.apiId,
      'title': instance.title,
      'description': instance.description,
      'video_path': instance.videoPath,
      'date_time': instance.dateTime.toIso8601String(),
      'favourite': Moment._boolToInt(instance.favourite),
      'mental_health': Moment._boolToInt(instance.mentalHealth),
      'fulfillment': Moment._boolToInt(instance.fulfillment),
      'awareness': Moment._boolToInt(instance.awareness),
      'joy': Moment._boolToInt(instance.joy),
      'habit': Moment._boolToInt(instance.habit),
      'goal': Moment._boolToInt(instance.goal),
      'improvement': Moment._boolToInt(instance.improvement),
      'discovering': Moment._boolToInt(instance.discovering),
      'relationship': Moment._boolToInt(instance.relationship),
    };
