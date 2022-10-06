import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../../../data/models/moment.dart';
import '../video_player/current_video_url_source.dart';
import '../video_player/video_player_presenter.dart';
import '../video_player/video_player_presenter_impl.dart';
import 'moment_page_view.dart';
import 'moments_presenter.dart';
import 'moments_presenter_impl.dart';
import 'moments_source.dart';

class MomentsPagerWidget extends StatefulWidget {
  const MomentsPagerWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return MomentsPagerState();
  }
}

class MomentsPagerState extends State<MomentsPagerWidget> {
  final MomentsPresenter _momentsPresenter = MomentsPresenterImpl();
  final CurrentVideoPresenter _videoPlayerPresenter =
      CurrentVideoPresenterImpl();
  GlobalKey<ScrollSnapListState> sslKey = GlobalKey();

  @override
  void initState() {
    _momentsPresenter.loadMoments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: <ChangeNotifierProvider<ChangeNotifier>>[
          ChangeNotifierProvider<MomentsSource>(
              create: (_) => _momentsPresenter.getMomentsSource()),
          ChangeNotifierProvider<CurrentVideoUrlSource>(
              create: (_) => _videoPlayerPresenter.getCurrentVideoUrlSource())
        ],
        child: Consumer<MomentsSource>(builder: (_, MomentsSource source, __) {
          final List<Moment> moments = source.getMoments();
          return ScrollSnapList(
            itemBuilder: (_, int index) {
              return MomentPageView(moment: source.getMoments()[index]);
            },
            onItemFocus: (int index) {
              _updateCurrentVideoUrl(moments[index].videoPath);
            },
            itemSize: MediaQuery.of(context).size.height,
            selectedItemAnchor: SelectedItemAnchor.START,
            scrollDirection: Axis.vertical,
            itemCount: moments.length,
            reverse: true,
            key: sslKey,
          );
        }));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _updateCurrentVideoUrl(String videoUrl) {
    _videoPlayerPresenter.updateCurrentVideoUrl(videoUrl);
  }
}
