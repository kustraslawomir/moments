import 'package:flutter/cupertino.dart';

import 'moment_description_text.dart';

class MomentDescriptionText extends StatefulWidget {
  const MomentDescriptionText({super.key, required this.text});

  final String text;

  @override
  State<StatefulWidget> createState() {
    return MomentDescriptionTextState();
  }
}

class MomentDescriptionTextState extends State<MomentDescriptionText> {
  final DescriptionPresenter _presenter = DescriptionPresenterImpl();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        builder: (_, bool isCollapsed, __) {
          return GestureDetector(
              onTap: () => _presenter.toggle(),
              child: Text(_presenter.getText(widget.text, isCollapsed)));
        },
        valueListenable: _presenter.isCollapsed());
  }
}
