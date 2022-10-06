import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../../../data/models/moment.dart';
import '../../../../i18n/strings.g.dart';
import '../../../styles/dimensions.dart';
import '../../../styles/styles.dart';
import '../../../utils/ui_settings.dart';
import '../../video_player/current_video_url_source.dart';
import '../../video_player/video_player_widget.dart';

class MomentPageView extends StatelessWidget {
  const MomentPageView({super.key, required this.moment});

  final Moment moment;

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
          Opacity(
              opacity: 0.7,
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: DEFAULT_PADDING,
                      right: DEFAULT_PADDING,
                      bottom: DEFAULT_PADDING),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(moment.title, style: momentCardTitleTextStyle),
                        const SizedBox(height: DEFAULT_PADDING),
                        ReadMoreText(moment.description,
                            trimMode: TrimMode.Line,
                            trimLines: MOMENT_DESCRIPTION_TRIM_LINES,
                            colorClickableText: READ_MORE_COLOR,
                            trimCollapsedText: t.read_more,
                            trimExpandedText: t.collapse,
                            style: momentCardDescriptionTextStyle)
                      ])))
        ]));
  }
}
