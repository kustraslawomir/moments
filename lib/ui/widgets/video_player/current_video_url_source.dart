import 'package:flutter/cupertino.dart';

class CurrentVideoUrlSource extends ChangeNotifier {
  String _videoUrl = '';

  void updateCurrentVideoUrl(String videoUrl) {
    _videoUrl = videoUrl;
    notifyListeners();
  }

  String getCurrentVideoUrl() {
    return _videoUrl;
  }
}
