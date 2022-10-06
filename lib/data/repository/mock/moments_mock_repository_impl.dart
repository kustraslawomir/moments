import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../../models/moment.dart';
import '../moments/moments_repository.dart';

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
    return list
        .map((dynamic element) =>
            Moment.fromJson(element as Map<String, dynamic>))
        .toList();
  }

  Future<String> _loadData() async {
    return rootBundle.loadString('assets/mock_data/data.json');
  }
}
