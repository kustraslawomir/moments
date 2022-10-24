import 'package:flutter/material.dart';

import '../../../../data/models/moment.dart';
import '../pager/moments_pager_widget.dart';

class FilteredMomentsPageWidget extends StatefulWidget {
  const FilteredMomentsPageWidget(
      {super.key,
      required this.moments,
      required this.filterTag,
      required this.isFilteringEnabled});

  final List<Moment> moments;
  final String filterTag;
  final bool isFilteringEnabled;

  @override
  State<StatefulWidget> createState() {
    return FilteredMomentsState();
  }
}

class FilteredMomentsState extends State<FilteredMomentsPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.filterTag),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: MomentsPagerWidget(
            moments: widget.moments,
            isFilteringEnabled: widget.isFilteringEnabled));
  }
}
