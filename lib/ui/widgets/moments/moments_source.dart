import 'package:flutter/cupertino.dart';

import '../../../data/models/moment.dart';
import '../../../data/repository/mock/moments_mock_repository_impl.dart';
import '../../../data/repository/moments/moments_repository.dart';
import '../../../data/repository/moments/moments_repository_impl.dart';
import '../../../data/settings/api_settings.dart';

class MomentsSource with ChangeNotifier {
  late final MomentsRepository _repository = _getRepository();

  final List<Moment> _moments = List<Moment>.empty(growable: true);

  Future<void> loadMoments() async {
    if (_moments.isNotEmpty) {
      _moments.clear();
    }
    _moments.addAll(await _repository.getDefaultMoments());
    notifyListeners();
  }

  Future<void> load10MomentsBeforeId(int id) async {
    _moments.addAll(await _repository.get10MomentsBeforeId(id));
    notifyListeners();
  }

  List<Moment> getMoments() {
    return _moments;
  }

  MomentsRepository _getRepository() {
    if (USE_MOCK_REPOSITORIES) {
      return MomentsMockRepositoryImpl();
    } else {
      return MomentsRepositoryImpl();
    }
  }
}
