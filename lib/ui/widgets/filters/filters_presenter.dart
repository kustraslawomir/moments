import '../../../data/filter/filter.dart';
import '../../../data/filter/moment_filter.dart';
import '../../../data/models/moment.dart';
import '../../../i18n/strings.g.dart';

abstract class FiltersPresenter {
  List<MomentFilter> getFilters();

  List<MomentFilter> getFiltersMomentFilters(Moment moment);
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
    MomentFilter(filter: Filter.RELATIONSHIP, title: t.relationship)
  ];

  @override
  List<MomentFilter> getFilters() {
    return _filters;
  }

  @override
  List<MomentFilter> getFiltersMomentFilters(Moment moment) {
    final List<MomentFilter> filters = <MomentFilter>[];
    if (moment.mentalHealth) {
      filters.add(
          MomentFilter(filter: Filter.MENTAL_HEALTH, title: t.mental_health));
    }
    if (moment.fulfillment) {
      filters
          .add(MomentFilter(filter: Filter.FULFILLMENT, title: t.fulfillment));
    }
    if (moment.awareness) {
      filters.add(MomentFilter(filter: Filter.AWARENESS, title: t.awareness));
    }
    if (moment.joy) {
      filters.add(MomentFilter(filter: Filter.JOY, title: t.joy));
    }
    if (moment.habit) {
      filters.add(MomentFilter(filter: Filter.HABIT, title: t.habit));
    }
    if (moment.goal) {
      filters.add(MomentFilter(filter: Filter.GOAL, title: t.goal));
    }
    if (moment.improvement) {
      filters
          .add(MomentFilter(filter: Filter.IMPROVEMENT, title: t.improvement));
    }
    if (moment.discovering) {
      filters
          .add(MomentFilter(filter: Filter.DISCOVERING, title: t.discovering));
    }
    if (moment.relationship) {
      filters.add(
          MomentFilter(filter: Filter.RELATIONSHIP, title: t.relationship));
    }

    return filters;
  }
}
