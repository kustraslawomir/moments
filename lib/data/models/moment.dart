import 'package:json_annotation/json_annotation.dart';

part 'moment.g.dart';

@JsonSerializable()
class Moment {
  const Moment(
      {required this.id,
      required this.title,
      required this.description,
      required this.videoPath,
      required this.dateTime});

  factory Moment.fromJson(Map<String, dynamic> json) => _$MomentFromJson(json);

  Map<String, dynamic> toJson() => _$MomentToJson(this);

  final int id;
  final String title;
  final String description;
  final String videoPath;
  final DateTime dateTime;
}
