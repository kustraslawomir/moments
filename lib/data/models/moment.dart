import 'package:json_annotation/json_annotation.dart';

part 'moment.g.dart';

@JsonSerializable()
class Moment {
  const Moment({
    required this.apiId,
    required this.title,
    required this.description,
    required this.videoPath,
    required this.created,
    required this.updated,
    required this.favourite,
    required this.mentalHealth,
    required this.physicalHealth,
    required this.fulfillment,
    required this.awareness,
    required this.joy,
    required this.habit,
    required this.goal,
    required this.improvement,
    required this.discovering,
    required this.relationship,
  });

  factory Moment.fromJson(Map<String, dynamic> json) => _$MomentFromJson(json);

  Map<String, dynamic> toJson() => _$MomentToJson(this);

  @JsonKey(name: 'api_id')
  final String apiId;
  final String title;
  final String description;
  @JsonKey(name: 'video_path')
  final String videoPath;
  final DateTime created;
  final DateTime updated;
  @JsonKey(fromJson: _boolFromInt, toJson: _boolToInt)
  final bool favourite;
  @JsonKey(name: 'mental_health', fromJson: _boolFromInt, toJson: _boolToInt)
  final bool mentalHealth;
  @JsonKey(name: 'physical_health', fromJson: _boolFromInt, toJson: _boolToInt)
  final bool physicalHealth;
  @JsonKey(fromJson: _boolFromInt, toJson: _boolToInt)
  final bool fulfillment;
  @JsonKey(fromJson: _boolFromInt, toJson: _boolToInt)
  final bool awareness;
  @JsonKey(fromJson: _boolFromInt, toJson: _boolToInt)
  final bool joy;
  @JsonKey(fromJson: _boolFromInt, toJson: _boolToInt)
  final bool habit;
  @JsonKey(fromJson: _boolFromInt, toJson: _boolToInt)
  final bool goal;
  @JsonKey(fromJson: _boolFromInt, toJson: _boolToInt)
  final bool improvement;
  @JsonKey(fromJson: _boolFromInt, toJson: _boolToInt)
  final bool discovering;
  @JsonKey(fromJson: _boolFromInt, toJson: _boolToInt)
  final bool relationship;

  static bool _boolFromInt(int? done) => done == 1;

  static int _boolToInt(bool done) => done ? 1 : 0;

  Moment copy(
      {String? apiId,
      String? title,
      String? description,
      String? videoPath,
      DateTime? created,
      DateTime? updated,
      DateTime? dateTime,
      bool? favourite,
      bool? mentalHealth,
      bool? physicalHealth,
      bool? fulfillment,
      bool? awareness,
      bool? joy,
      bool? habit,
      bool? goal,
      bool? improvement,
      bool? discovering,
      bool? relationship}) {
    return Moment(
        apiId: apiId ?? this.apiId,
        title: title ?? this.title,
        description: description ?? this.description,
        videoPath: videoPath ?? this.videoPath,
        created: created ?? this.created,
        updated: updated ?? this.updated,
        favourite: favourite ?? this.favourite,
        mentalHealth: mentalHealth ?? this.mentalHealth,
        physicalHealth: physicalHealth ?? this.physicalHealth,
        fulfillment: fulfillment ?? this.fulfillment,
        awareness: awareness ?? this.awareness,
        joy: joy ?? this.joy,
        habit: habit ?? this.habit,
        goal: goal ?? this.goal,
        improvement: improvement ?? this.improvement,
        discovering: discovering ?? this.discovering,
        relationship: relationship ?? this.relationship);
  }
}
