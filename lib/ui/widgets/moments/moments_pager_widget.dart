import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/moment.dart';
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
  final MomentsPresenter _presenter = MomentsPresenterImpl();

  @override
  void initState() {
    _presenter.loadMoments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MomentsSource>(
        create: (BuildContext context) => _presenter.getMomentsSource(),
        child: Consumer<MomentsSource>(
          builder: (_, MomentsSource source, __) {
            return PageView.builder(itemBuilder: (_, int index) {
              final List<Moment> moments = source.getMoments();
              if (moments.isEmpty) {
                return const SizedBox(
                    height: 25, width: 25, child: CircularProgressIndicator());
              } else {
                return MomentPageView(moment: source.getMoments()[index]);
              }
            });
          },
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
