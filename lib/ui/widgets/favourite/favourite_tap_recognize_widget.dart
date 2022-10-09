import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../data/models/moment.dart';
import '../../../gen/assets.gen.dart';
import '../../utils/ui_settings.dart';
import '../moments/moments_source.dart';
import 'favourite_presenter.dart';
import 'favourite_presenter_impl.dart';

class FavouriteTapRecognizeWidget extends StatefulWidget {
  const FavouriteTapRecognizeWidget({super.key, required this.moment});

  final Moment moment;

  @override
  State<StatefulWidget> createState() {
    return FavouriteTapRecognizeState();
  }
}

class FavouriteTapRecognizeState extends State<FavouriteTapRecognizeWidget>
    with TickerProviderStateMixin {
  final FavouritePresenter _presenter = FavouritePresenterImpl();

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
    final MomentsSource source =
        Provider.of<MomentsSource>(context, listen: false);
    return Opacity(
        opacity: DOUBLE_TAP_LIKE_OPACITY,
        child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Lottie.asset(
              Assets.animation.doubleTapAnimationWhite,
              controller: _controller,
              onLoaded: (LottieComposition composition) {
                _controller.duration = composition.duration;
              },
            ),
            onDoubleTap: () {
              _controller.forward(from: 0);
              _presenter.updateFavouriteState(
                  favourite: true,
                  moment: widget.moment,
                  momentsSource: source);
            }));
  }
}
