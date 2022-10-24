import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moments/ui/widgets/moments/pager/moments_pager_presenter.dart';
import 'package:moments/ui/widgets/moments/pager/snap_position_source.dart';
import 'package:provider/provider.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../../../../data/filter/filter.dart';
import '../../../../data/models/moment.dart';
import '../../filters/filters_widget.dart';
import '../../no_data/no_data_widget.dart';
import '../../video_player/current_video_url_source.dart';
import '../../video_player/video_player_presenter.dart';
import '../../video_player/video_player_presenter_impl.dart';
import '../filtered_moments/filtered_moments_page.dart';
import '../moments_source.dart';
import '../page/moment_page_view.dart';
import '../pager_navigation/pager_navigate_up_widget.dart';
import 'moments_pager_presenter_impl.dart';

class MomentsPagerWidget extends StatefulWidget {
  const MomentsPagerWidget(
      {super.key, required this.moments, required this.isFilteringEnabled});

  final List<Moment> moments;
  final bool isFilteringEnabled;

  @override
  State<StatefulWidget> createState() {
    return MomentsPagerState();
  }
}

class MomentsPagerState extends State<MomentsPagerWidget> {
  final MomentsPagerPresenter _presenter = MomentsPagerPresenterImpl();

  final CurrentVideoPresenter _videoPlayerPresenter =
      CurrentVideoPresenterImpl();
  GlobalKey<ScrollSnapListState> sslKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: <ChangeNotifierProvider<ChangeNotifier>>[
          ChangeNotifierProvider<SnapPositionSource>(
              create: (_) => _presenter.getCurrentSnapPositionSource()),
          ChangeNotifierProvider<CurrentVideoUrlSource>(
              create: (_) => _videoPlayerPresenter.getCurrentVideoUrlSource())
        ],
        child: Stack(children: <Widget>[
          if (widget.moments.isNotEmpty) ...<Widget>[
            ScrollSnapList(
                itemSize: MediaQuery.of(context).size.height,
                scrollDirection: Axis.vertical,
                itemCount: widget.moments.length,
                key: sslKey,
                onItemFocus: (int index) {
                  _presenter.updateCurrentSnapPosition(index);
                  _videoPlayerPresenter
                      .updateCurrentVideoUrl(widget.moments[index].videoPath);
                },
                itemBuilder: (_, int index) {
                  return MomentPageView(moment: widget.moments[index]);
                }),
            PagerNavigateUpWidget(onPressedButton: () => _focusToItem(0))
          ],
          if (widget.moments.isEmpty) ...<Widget>[const NoDataWidget()],
          Visibility(
              visible: widget.isFilteringEnabled,
              child: FilterWidget(onFilterSelected: (Filter filter) {
                _openFilteredMomentsPage(
                    moments: _presenter.filter(filter, widget.moments),
                    filterTag: filter.name);
              }))
        ]));
  }

  void _focusToItem(int index) {
    sslKey.currentState?.focusToItem(index);
  }

  void _openFilteredMomentsPage(
      {required List<Moment> moments, required String filterTag}) {
    final MomentsSource source =
        Provider.of<MomentsSource>(context, listen: false);

    Navigator.push(
        context,
        MaterialPageRoute<FilteredMomentsPageWidget>(
            builder: (BuildContext context) => FilteredMomentsPageWidget(
                isFilteringEnabled: false,
                moments: moments,
                filterTag: filterTag)));
  }
}
