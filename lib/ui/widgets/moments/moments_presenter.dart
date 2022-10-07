import 'moments_source.dart';
import 'pager/snap_position_source.dart';

abstract class MomentsPresenter {
  MomentsSource getMomentsSource();

  void loadMoments();

  void load10MomentsBefore(int id);

  void storeSnapPosition(int position);

  Future<int> getInitialSnapPosition();

  void updateCurrentSnapPosition(int snapPosition);

  SnapPositionSource getCurrentSnapPositionSource();
}
