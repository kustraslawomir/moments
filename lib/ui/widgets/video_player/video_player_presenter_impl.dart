import 'current_video_url_source.dart';
import 'video_player_presenter.dart';

class CurrentVideoPresenterImpl extends CurrentVideoPresenter {
  final CurrentVideoUrlSource _currentVideoUrlSource = CurrentVideoUrlSource();

  @override
  CurrentVideoUrlSource getCurrentVideoUrlSource() {
    return _currentVideoUrlSource;
  }

  @override
  void updateCurrentVideoUrl(String videoUrl) {
    _currentVideoUrlSource.updateCurrentVideoUrl(videoUrl);
  }
}
