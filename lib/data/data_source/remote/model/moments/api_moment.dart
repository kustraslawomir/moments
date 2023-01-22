import 'package:json_annotation/json_annotation.dart';

part 'api_moment.g.dart';

@JsonSerializable()
class ApiMoment {
  const ApiMoment({
    required this.id,
    required this.title,
    required this.description,
    required this.videoPath,
    required this.created,
    required this.updated,
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

  factory ApiMoment.fromJson(Map<String, dynamic> json) =>
      _$ApiMomentFromJson(json);

  Map<String, dynamic> toJson() => _$ApiMomentToJson(this);

  final String id;
  final String title;
  final String description;
  @JsonKey(name: 'video_path')
  final String videoPath;
  final DateTime created;
  final DateTime updated;
  @JsonKey(name: 'mental_health')
  final bool mentalHealth;
  @JsonKey(name: 'physical_health')
  final bool physicalHealth;
  final bool fulfillment;
  final bool awareness;
  final bool joy;
  final bool habit;
  final bool goal;
  final bool improvement;
  final bool discovering;
  final bool relationship;
}
