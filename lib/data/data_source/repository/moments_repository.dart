import '../../models/moment.dart';

abstract class MomentsRepository {
  Future<void> syncMoments();

  Future<List<Moment>> getCachedMoments();

  Future<List<Moment>> get10MomentsBeforeId(int id);
}
