import '../../../data/filter/filter.dart';
import 'moments_presenter.dart';
import 'moments_source.dart';
import 'pager/snap_position_source.dart';

class MomentsPresenterImpl extends MomentsPresenter {
  final MomentsSource _momentsSource = MomentsSource();
  final SnapPositionSource _snapPositionSource = SnapPositionSource();

  @override
  MomentsSource getMomentsSource() {
    return _momentsSource;
  }

  @override
  void loadMoments() {
    _momentsSource.sync();
  }

  @override
  void updateCurrentSnapPosition(int snapPosition) {
    _snapPositionSource.updateSnapPosition(snapPosition);
  }

  @override
  SnapPositionSource getCurrentSnapPositionSource() {
    return _snapPositionSource;
  }

  @override
  void filterBy(Filter filter) {
    _momentsSource.filterBy(filter);
  }
}
