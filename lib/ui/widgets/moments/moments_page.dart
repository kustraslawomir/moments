import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/moment.dart';
import 'moments_source.dart';
import 'pager/moments_pager_widget.dart';

class MomentsPage extends StatefulWidget {
  const MomentsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MomentsState();
  }
}

class MomentsState extends State<MomentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<MomentsSource>(builder: (_, MomentsSource source, __) {
      final List<Moment> moments = source.getMoments();
      if (moments.isNotEmpty) {
        return MomentsPagerWidget(
            moments: source.getMoments(), isFilteringEnabled: true);
      }
      return const Center(child: CircularProgressIndicator());
    }));
  }
}
