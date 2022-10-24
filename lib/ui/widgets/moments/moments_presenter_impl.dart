import 'moments_presenter.dart';
import 'moments_source.dart';

class MomentsPresenterImpl extends MomentsPresenter {
  final MomentsSource _momentsSource = MomentsSource();

  @override
  MomentsSource getMomentsSource() {
    return _momentsSource;
  }

  @override
  void loadMoments() {
    _momentsSource.sync();
  }
}
