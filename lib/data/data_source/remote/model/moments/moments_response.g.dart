// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MomentsResponse _$MomentsResponseFromJson(Map<String, dynamic> json) =>
    MomentsResponse(
      page: json['page'] as int,
      perPage: json['perPage'] as int,
      totalItems: json['totalItems'] as int,
      totalPages: json['totalPages'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => ApiMoment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MomentsResponseToJson(MomentsResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'perPage': instance.perPage,
      'totalItems': instance.totalItems,
      'totalPages': instance.totalPages,
      'items': instance.items,
    };
