import '../../../data/filter/filter.dart';
import 'moments_source.dart';
import 'pager/snap_position_source.dart';

abstract class MomentsPresenter {
  MomentsSource getMomentsSource();

  void loadMoments();

  void updateCurrentSnapPosition(int snapPosition);

  SnapPositionSource getCurrentSnapPositionSource();

  void filterBy(Filter filter);
}
