import 'package:flutter/cupertino.dart';

import '../../../data/data_source/repository/moments_repository.dart';
import '../../../data/data_source/repository/moments_repository_impl.dart';
import '../../../data/models/moment.dart';

class MomentsSource with ChangeNotifier {
  late final MomentsRepository _repository = MomentsRepositoryImpl();

  final List<Moment> _moments = List<Moment>.empty(growable: true);

  List<Moment> getMoments() {
    return _moments;
  }

  Future<void> sync() async {
    _moments.clear();

    await _repository.syncMoments();

    final List<Moment> moments = await _repository.getCachedMoments();
    _moments.addAll(moments);
    notifyListeners();
  }

  void updateMoment(Moment moment) {
    final int index =
        _moments.indexWhere((Moment element) => element.apiId == moment.apiId);
    _moments[index] = moment;
    notifyListeners();
  }
}
