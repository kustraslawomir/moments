import 'moments_presenter.dart';
import 'moments_source.dart';

class MomentsPresenterImpl extends MomentsPresenter {
  final MomentsSource _source = MomentsSource();

  @override
  MomentsSource getMomentsSource() {
    return _source;
  }

  @override
  void loadMoments() {
    _source.loadMoments();
  }

  @override
  void load10MomentsBefore(int id) {
    _source.load10MomentsBeforeId(id);
  }
}
