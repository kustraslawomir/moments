import 'package:flutter/cupertino.dart';

class SnapPositionSource extends ChangeNotifier {
  int _currentSnapPosition = 0;

  void updateSnapPosition(int position) {
    _currentSnapPosition = position;
    print("update current snap position: $_currentSnapPosition");
    notifyListeners();
  }

  int getCurrentSnapPosition() {
    print("get current snap position: $_currentSnapPosition");
    return _currentSnapPosition;
  }

  @override
  void dispose() {
    print("dispose snap position");
    super.dispose();
  }
}
