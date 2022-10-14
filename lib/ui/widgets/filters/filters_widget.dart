import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/filter/filter.dart';
import '../../../data/filter/moment_filter.dart';
import '../../utils/ui_settings.dart';
import 'filters_presenter.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key, required this.onFilterSelected});

  final Function(Filter filter) onFilterSelected;

  @override
  State<StatefulWidget> createState() {
    return FilterState();
  }
}

class FilterState extends State<FilterWidget> {
  final FiltersPresenter _presenter = FiltersPresenterImpl();

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: AlignmentDirectional.topEnd,
        child: Padding(
            padding: const EdgeInsets.only(
              top: BELOW_STATUS_BAR_PADDING,
              bottom: DEFAULT_PADDING,
              left: DEFAULT_PADDING,
              right: DEFAULT_PADDING,
            ),
            child: PopupMenuButton<MomentFilter>(
                icon: const Icon(Icons.filter_alt_outlined),
                initialValue: _presenter.getFilters().first,
                onSelected: (MomentFilter momentFilter) {
                  widget.onFilterSelected(momentFilter.filter);
                },
                itemBuilder: (BuildContext context) {
                  return _presenter
                      .getFilters()
                      .map((MomentFilter filter) => PopupMenuItem<MomentFilter>(
                            value: filter,
                            child: Text(filter.title),
                          ))
                      .toList();
                })));
  }
}
