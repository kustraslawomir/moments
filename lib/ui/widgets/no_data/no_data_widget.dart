import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../gen/assets.gen.dart';
import '../../../i18n/strings.g.dart';
import '../../utils/ui_settings.dart';

class NoDataWidget extends StatefulWidget {
  const NoDataWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return NoDataState();
  }
}

class NoDataState extends State<NoDataWidget> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(DEFAULT_PADDING),
        color: Colors.black87,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Lottie.asset(
                  repeat: true,
                  Assets.animation.playfullCat,
                  controller: _controller,
                  onLoaded: (LottieComposition composition) {
                _controller.duration = composition.duration;
                _controller.forward(from: 0);
              }),
              Text(t.no_filter_results, textAlign: TextAlign.center)
            ]));
  }
}
