import '../../models/moment.dart';

abstract class MomentsRepository {
  Future<List<Moment>> get10MomentsBeforeId(int id);

  Future<List<Moment>> getDefaultMoments();
}
