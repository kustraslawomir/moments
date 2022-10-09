// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Moment _$MomentFromJson(Map<String, dynamic> json) => Moment(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      videoPath: json['video_path'] as String,
      dateTime: DateTime.parse(json['date_time'] as String),
      favourite: Moment._boolFromInt(json['favourite'] as int),
    );

Map<String, dynamic> _$MomentToJson(Moment instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'video_path': instance.videoPath,
      'date_time': instance.dateTime.toIso8601String(),
      'favourite': Moment._boolToInt(instance.favourite),
    };
