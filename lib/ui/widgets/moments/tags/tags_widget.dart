import 'package:flutter/cupertino.dart';

import '../../../../data/filter/moment_filter.dart';

class TagsWidget extends StatelessWidget {
  const TagsWidget({super.key, required this.momentFilters});

  final List<MomentFilter> momentFilters;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Row(
            children: momentFilters
                .map((MomentFilter element) => Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Text(element.title)))
                .toList()));
  }
}
