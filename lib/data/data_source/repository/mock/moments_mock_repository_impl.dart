import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../../../models/moment.dart';
import '../../local/database/moments_database.dart';
import '../moments_repository.dart';

class MomentsMockRepositoryImpl extends MomentsRepository {
  @override
  Future<List<Moment>> getDefaultMoments() async {
    return _getRandomMoments();
  }

  @override
  Future<List<Moment>> get10MomentsBeforeId(int id) async {
    await Future<List<Moment>>.delayed(const Duration(seconds: 5), () {
      return _getRandomMoments();
    });

    return _getRandomMoments();
  }

  Future<List<Moment>> _getRandomMoments() async {
    final String data = await _loadData();
    final List<dynamic> list = json.decode(data) as List<dynamic>;
    final List<Moment> moments = list
        .map((dynamic element) =>
            Moment.fromJson(element as Map<String, dynamic>))
        .toList();

    final MomentsDatabase momentsDatabase = MomentsDatabase.instance;
    moments.forEach((Moment element) => momentsDatabase.create(element));
    return momentsDatabase.readMoments();
  }

  Future<String> _loadData() async {
    return rootBundle.loadString('assets/mock_data/moments_local_data.json');
  }
}
