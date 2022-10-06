import '../../models/moment.dart';
import '../moments/moments_repository.dart';
import 'mock_data.dart';

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

  List<Moment> _getRandomMoments() {
    final DateTime currentDateTime = DateTime.now();
    final List<Moment> moments = List<Moment>.empty(growable: true);

    for (int i = 0; i < 5; i++) {
      moments.add(Moment(
          id: generateId(),
          title: mockTitle1,
          description: mockDescription,
          videoPath: videoPaths[0],
          dateTime: currentDateTime));

      moments.add(Moment(
          id: generateId(),
          title: mockTitle2,
          description: mockDescription,
          videoPath: videoPaths[1],
          dateTime: currentDateTime));
    }
    return moments;
  }
}
