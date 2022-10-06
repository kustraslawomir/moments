import 'current_video_url_source.dart';

abstract class CurrentVideoPresenter {
  void updateCurrentVideoUrl(String videoUrl);

  CurrentVideoUrlSource getCurrentVideoUrlSource();
}
