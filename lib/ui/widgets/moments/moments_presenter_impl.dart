import '../../../data/constants/preference_keys.dart';
import '../../../data/preferences/app_preferences_repository.dart';
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
    _momentsSource.loadMoments();
  }

  @override
  void load10MomentsBefore(int id) {
    _momentsSource.load10MomentsBeforeId(id);
  }

  @override
  Future<int> getInitialSnapPosition() {
    return AppPreferencesRepository.instance
        .getInt(key: ConfigurationKeys.SNAP_POSITION, defaultValue: 0);
  }

  @override
  void storeSnapPosition(int position) {
    AppPreferencesRepository.instance
        .storeInt(key: ConfigurationKeys.SNAP_POSITION, value: position);
  }

  @override
  void updateCurrentSnapPosition(int snapPosition) {
    _snapPositionSource.updateSnapPosition(snapPosition);
  }

  @override
  SnapPositionSource getCurrentSnapPositionSource() {
    return _snapPositionSource;
  }
}
