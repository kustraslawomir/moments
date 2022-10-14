import 'package:json_annotation/json_annotation.dart';

import '../../../../models/moment.dart';
import 'api_moment.dart';

part 'moments_response.g.dart';

@JsonSerializable()
class MomentsResponse {
  MomentsResponse(
      {required this.page,
      required this.perPage,
      required this.totalItems,
      required this.totalPages,
      required this.items});

  factory MomentsResponse.fromJson(Map<String, dynamic> json) =>
      _$MomentsResponseFromJson(json);

  int page;
  int perPage;
  int totalItems;
  int totalPages;
  List<ApiMoment> items;

  Map<String, dynamic> toJson() => _$MomentsResponseToJson(this);
}
