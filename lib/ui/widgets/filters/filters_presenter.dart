import '../../../data/filter/filter.dart';
import '../../../data/filter/moment_filter.dart';
import '../../../i18n/strings.g.dart';

abstract class FiltersPresenter {
  List<MomentFilter> getFilters();
}

class FiltersPresenterImpl extends FiltersPresenter {
  final List<MomentFilter> _filters = <MomentFilter>[
    MomentFilter(filter: Filter.FAVOURITE, title: t.filter_favourites),
    MomentFilter(filter: Filter.MENTAL_HEALTH, title: t.mental_health),
    MomentFilter(filter: Filter.FULFILLMENT, title: t.fulfillment),
    MomentFilter(filter: Filter.AWARENESS, title: t.awareness),
    MomentFilter(filter: Filter.JOY, title: t.joy),
    MomentFilter(filter: Filter.HABIT, title: t.habit),
    MomentFilter(filter: Filter.GOAL, title: t.goal),
    MomentFilter(filter: Filter.IMPROVEMENT, title: t.improvement),
    MomentFilter(filter: Filter.DISCOVERING, title: t.discovering),
    MomentFilter(filter: Filter.RELATIONSHIP, title: t.relationship),
    MomentFilter(filter: Filter.HEALTH, title: t.health)
  ];

  @override
  List<MomentFilter> getFilters() {
    return _filters;
  }
}
