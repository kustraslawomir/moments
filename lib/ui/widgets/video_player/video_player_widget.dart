import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moments/ui/widgets/video_player/video_player_configuration.dart';

import '../../utils/ui_settings.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget(
      {super.key, required this.videoUrl, required this.play});

  final String videoUrl;
  final bool play;

  @override
  State<StatefulWidget> createState() {
    return _VideoPlayerWidgetState();
  }
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late CachedVideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CachedVideoPlayerController.network(widget.videoUrl)
      ..setVolume(VOLUME)
      ..setPlaybackSpeed(PLAYBACK_SPEED);

    _controller.initialize().then((_) {
      if (widget.play) {
        if (kDebugMode) {
          print('Play: ${widget.videoUrl}');
        }
        _controller.setLooping(true);
        _controller.play();
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Stack(fit: StackFit.expand, children: <Widget>[
            Opacity(
                opacity: VIDEO_PLAYER_OPACITY,
                child: SizedBox.expand(
                    child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                            width: _controller.value.size.width,
                            height: _controller.value.size.height,
                            child: CachedVideoPlayer(_controller))))),
            Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: <Color>[
                  Colors.black,
                  Colors.transparent,
                ])))
          ])
        : const SizedBox.expand(
            child: Center(
            child: CircularProgressIndicator(),
          ));
  }

  @override
  void didUpdateWidget(VideoPlayerWidget oldWidget) {
    if (oldWidget.play != widget.play) {
      if (widget.play) {
        _controller.play();
        _controller.setLooping(true);
      } else {
        _controller.pause();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
