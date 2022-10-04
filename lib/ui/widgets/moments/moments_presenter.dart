import 'moments_source.dart';

abstract class MomentsPresenter {
  MomentsSource getMomentsSource();

  void loadMoments();

  void load10MomentsBefore(int id);
}
