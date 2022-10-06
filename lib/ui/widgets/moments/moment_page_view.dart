import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/moment.dart';
import '../video_player/current_video_url_source.dart';
import '../video_player/video_player_widget.dart';

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
            print("instance: ${source.toJson()}");
            return VideoPlayerWidget(
                videoUrl: moment.videoPath,
                play: source.getCurrentVideoUrl() == moment.videoPath);
          }),
          Text(moment.title),
        ]));
  }
}
