import 'package:flutter/cupertino.dart';

import '../../../data/data_source/repository/moments_repository.dart';
import '../../../data/data_source/repository/moments_repository_impl.dart';
import '../../../data/filter/filter.dart';
import '../../../data/models/moment.dart';

class MomentsSource with ChangeNotifier {
  late final MomentsRepository _repository = MomentsRepositoryImpl();

  final List<Moment> _moments = List<Moment>.empty(growable: true);
  final List<Moment> _filteredMoments = List<Moment>.empty(growable: true);

  List<Moment> getMoments() {
    return _filteredMoments;
  }

  Future<void> sync() async {
    _moments.clear();
    _filteredMoments.clear();

    await _repository.syncMoments();

    final List<Moment> moments = await _repository.getCachedMoments();
    _moments.addAll(moments);
    _filteredMoments.addAll(moments);

    notifyListeners();
  }

  void updateMoment(Moment moment) {
    final int index = _filteredMoments
        .indexWhere((Moment element) => element.apiId == moment.apiId);
    _filteredMoments[index] = moment;
    notifyListeners();
  }

  void filterBy(Filter filter) {
    _filteredMoments.clear();

    switch (filter) {
      case Filter.ALL:
        _filteredMoments.addAll(_moments);
        break;
      case Filter.FAVOURITE:
        _filteredMoments
            .addAll(_moments.where((Moment element) => element.favourite));
        break;
      case Filter.MENTAL_HEALTH:
        _filteredMoments
            .addAll(_moments.where((Moment element) => element.mentalHealth));
        break;
      case Filter.FULFILLMENT:
        _filteredMoments
            .addAll(_moments.where((Moment element) => element.fulfillment));
        break;
      case Filter.AWARENESS:
        _filteredMoments
            .addAll(_moments.where((Moment element) => element.awareness));
        break;
      case Filter.JOY:
        _filteredMoments
            .addAll(_moments.where((Moment element) => element.joy));
        break;
      case Filter.HABIT:
        _filteredMoments
            .addAll(_moments.where((Moment element) => element.habit));
        break;
      case Filter.GOAL:
        _filteredMoments
            .addAll(_moments.where((Moment element) => element.goal));
        break;
      case Filter.IMPROVEMENT:
        _filteredMoments
            .addAll(_moments.where((Moment element) => element.improvement));
        break;
      case Filter.DISCOVERING:
        _filteredMoments
            .addAll(_moments.where((Moment element) => element.discovering));
        break;
      case Filter.RELATIONSHIP:
        _filteredMoments
            .addAll(_moments.where((Moment element) => element.relationship));
        break;
      case Filter.HEALTH:
        _filteredMoments
            .addAll(_moments.where((Moment element) => element.mentalHealth));
        break;
    }

    notifyListeners();
  }
}
