import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moments/ui/widgets/moments/pager/snap_position_source.dart';
import 'package:provider/provider.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../../../../data/models/moment.dart';
import '../../filters/filters_widget.dart';
import '../../video_player/current_video_url_source.dart';
import '../../video_player/video_player_presenter.dart';
import '../../video_player/video_player_presenter_impl.dart';
import '../moments_presenter.dart';
import '../moments_presenter_impl.dart';
import '../moments_source.dart';
import '../page/moment_page_view.dart';
import '../pager_navigation/pager_navigate_up_widget.dart';

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
          ChangeNotifierProvider<SnapPositionSource>(
              create: (_) => _momentsPresenter.getCurrentSnapPositionSource()),
          ChangeNotifierProvider<CurrentVideoUrlSource>(
              create: (_) => _videoPlayerPresenter.getCurrentVideoUrlSource())
        ],
        child: Consumer<MomentsSource>(
            builder: (_, MomentsSource momentsSource, __) {
          final List<Moment> moments = momentsSource.getMoments();
          return FutureBuilder<int>(
              future: _momentsPresenter.getInitialSnapPosition(),
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Stack(children: <Widget>[
                  FilterWidget(),
                  ScrollSnapList(
                      onItemFocus: (int index) {
                        _momentsPresenter.updateCurrentSnapPosition(index);
                        _momentsPresenter.storeSnapPosition(index);
                        _videoPlayerPresenter
                            .updateCurrentVideoUrl(moments[index].videoPath);
                      },
                      itemBuilder: (_, int index) => MomentPageView(
                          moment: momentsSource.getMoments()[index]),
                      initialIndex: snapshot.data?.toDouble() ?? 0,
                      itemSize: MediaQuery.of(context).size.height,
                      scrollDirection: Axis.vertical,
                      itemCount: moments.length,
                      key: sslKey),
                  PagerNavigateUpWidget(onPressedButton: () => _focusToItem(0))
                ]);
              });
        }));
  }

  void _focusToItem(int index) {
    sslKey.currentState?.focusToItem(index);
  }
}
