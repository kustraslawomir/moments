import 'package:flutter/cupertino.dart';

import '../../styles/dimensions.dart';

abstract class DescriptionPresenter {
  ValueNotifier<bool> isCollapsed();

  String getText(String text, bool isCollapsed);

  void toggle();
}

class DescriptionPresenterImpl extends DescriptionPresenter {
  final ValueNotifier<bool> _isCollapsed = ValueNotifier<bool>(true);

  @override
  String getText(String text, bool isCollapsed) {
    if (!isCollapsed) {
      return text;
    }

    if (text.length <= collapsedTextLength) {
      return text;
    }

    final String shortText = text.substring(0, collapsedTextLength);
    return '$shortText ...';
  }

  @override
  ValueNotifier<bool> isCollapsed() {
    return _isCollapsed;
  }

  @override
  void toggle() {
    _isCollapsed.value = !_isCollapsed.value;
  }
}
