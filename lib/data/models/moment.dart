import 'package:json_annotation/json_annotation.dart';

part 'moment.g.dart';

@JsonSerializable()
class Moment {
  const Moment(
      {required this.id,
      required this.title,
      required this.description,
      required this.videoPath,
      required this.dateTime,
      required this.favourite});

  factory Moment.fromJson(Map<String, dynamic> json) => _$MomentFromJson(json);

  Map<String, dynamic> toJson() => _$MomentToJson(this);

  final int id;
  final String title;
  final String description;
  @JsonKey(name: 'video_path')
  final String videoPath;
  @JsonKey(name: 'date_time')
  final DateTime dateTime;
  @JsonKey(fromJson: _boolFromInt, toJson: _boolToInt)
  final bool favourite;

  static bool _boolFromInt(int done) => done == 1;

  static int _boolToInt(bool done) => done ? 1 : 0;

  Moment copy(
      {int? id,
      String? title,
      String? description,
      String? videoPath,
      DateTime? dateTime,
      bool? favourite}) {
    return Moment(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        videoPath: videoPath ?? this.videoPath,
        dateTime: dateTime ?? this.dateTime,
        favourite: favourite ?? this.favourite);
  }
}
