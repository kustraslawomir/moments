import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/moment.dart';
import '../../../styles/dimensions.dart';
import '../../../styles/styles.dart';
import '../../../utils/ui_settings.dart';
import '../../favourite/favourite_button_widget.dart';
import '../../favourite/favourite_tap_recognize_widget.dart';
import '../../filters/filters_presenter.dart';
import '../../moment_description/collapse_text.dart';
import '../../video_player/current_video_url_source.dart';
import '../../video_player/video_player_widget.dart';
import '../tags/tags_widget.dart';

class MomentPageView extends StatelessWidget {
  MomentPageView({super.key, required this.moment});

  final Moment moment;

  final FiltersPresenter _presenter = FiltersPresenterImpl();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        color: Colors.black,
        height: size.height,
        width: size.width,
        child: Stack(fit: StackFit.expand, children: <Widget>[
          Consumer<CurrentVideoUrlSource>(
              builder: (_, CurrentVideoUrlSource source, __) {
            return VideoPlayerWidget(
                videoUrl: moment.videoPath,
                play: source.getCurrentVideoUrl() == moment.videoPath);
          }),
          FavouriteTapRecognizeWidget(moment: moment),
          TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.1, end: 1.0),
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: fadeInContentDurationMs),
              builder: (_, double opacity, __) {
                return Opacity(
                    opacity: opacity,
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: DEFAULT_PADDING,
                            right: DEFAULT_PADDING,
                            bottom: DEFAULT_PADDING * 3),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              RichText(
                                  text: TextSpan(children: <InlineSpan>[
                                WidgetSpan(
                                  child: FavouriteButtonWidget(moment: moment),
                                ),
                                TextSpan(
                                    text: moment.title,
                                    style: momentCardTitleTextStyle)
                              ])),
                              const SizedBox(height: DEFAULT_PADDING),
                              MomentDescriptionText(text: moment.description),
                              const SizedBox(height: DEFAULT_PADDING),
                              TagsWidget(
                                  momentFilters: _presenter
                                      .getFiltersMomentFilters(moment))
                            ])));
              })
        ]));
  }
}
