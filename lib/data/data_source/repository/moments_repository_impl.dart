import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../ui/utils/date_utils.dart';
import '../../models/moment.dart';
import '../local/database/moments_database.dart';
import '../remote/dio_client.dart';
import '../remote/model/moments/api_moment.dart';
import '../remote/model/moments/moments_response.dart';
import 'moments_repository.dart';

class MomentsRepositoryImpl extends MomentsRepository {
  final DioClient dioClient =
      DioClient(Dio()..interceptors.add(PrettyDioLogger()));

  final MomentsDatabase _momentsDatabase = MomentsDatabase.instance;

  @override
  Future<List<Moment>> get10MomentsBeforeId(int id) async {
    throw Exception('Not implemented yet.');
  }

  @override
  Future<void> syncMoments() async {
    final Map<String, dynamic> queries = <String, dynamic>{};

    final String currentFilterDate = _getCurrentDate();
    final String momentDate = await _getMomentFilterDate(_momentsDatabase);

    queries['filter'] =
        "(date_time <= '$currentFilterDate}' && date_time > '$momentDate')";

    try {
      final Response<dynamic> response = await dioClient
          .get('/api/collections/moments/records', queryParameters: queries);

      if (response.statusCode != HttpStatus.ok) {
        throw const HttpException('Unable to fetch moments');
      }

      final dynamic data = response.data;
      final MomentsResponse momentsResponse =
          MomentsResponse.fromJson(data as Map<String, dynamic>);

      final List<Moment> moments = momentsResponse.items
          .map((ApiMoment element) => Moment(
              apiId: element.id,
              title: element.title,
              description: element.description,
              videoPath: element.videoPath,
              dateTime: element.dateTime,
              mentalHealth: element.mentalHealth,
              fulfillment: element.fulfillment,
              awareness: element.awareness,
              joy: element.joy,
              habit: element.habit,
              goal: element.goal,
              improvement: element.improvement,
              discovering: element.discovering,
              relationship: element.relationship,
              favourite: false))
          .toList();

      return await _momentsDatabase.insertMoments(moments);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> _getMomentFilterDate(MomentsDatabase momentsDatabase) async {
    final Moment? lastStoredMoment = await momentsDatabase.readLastMoment();
    final String momentDate = lastStoredMoment?.dateTime
            .add(const Duration(days: 1))
            .formatToAppDate() ??
        '';
    return momentDate;
  }

  String _getCurrentDate() => DateTime.now().formatToAppDate();

  @override
  Future<List<Moment>> getCachedMoments() {
    return _momentsDatabase.readMoments();
  }
}
