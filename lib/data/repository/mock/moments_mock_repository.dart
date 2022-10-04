import '../../models/moment.dart';
import 'mock_data.dart';

abstract class MomentsMockRepository {
  Future<List<Moment>> get10MomentsBeforeId(int id);

  Future<List<Moment>> getDefaultMoments();
}

class MomentsMockRepositoryImpl extends MomentsMockRepository {
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

  List<Moment> _getRandomMoments() {
    final DateTime currentDateTime = DateTime.now();
    final List<Moment> moments = List<Moment>.empty(growable: true);

    for (int i = 0; i < 5; i++) {
      moments.add(Moment(
          id: generateId(),
          title: mockTitle1,
          description: mockDescription,
          videoPath: videoPath1,
          dateTime: currentDateTime));

      moments.add(Moment(
          id: generateId(),
          title: mockTitle2,
          description: mockDescription,
          videoPath: videoPath2,
          dateTime: currentDateTime));
    }
    return moments;
  }
}
