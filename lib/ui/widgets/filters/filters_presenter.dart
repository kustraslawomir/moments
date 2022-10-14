import '../../../data/filter/filter.dart';
import '../../../data/filter/moment_filter.dart';
import '../../../i18n/strings.g.dart';

abstract class FiltersPresenter {
  List<MomentFilter> getFilters();
}

class FiltersPresenterImpl extends FiltersPresenter {
  final List<MomentFilter> _filters = [
    MomentFilter(filter: Filter.ALL, title: t.filter_all),
    MomentFilter(filter: Filter.FAVOURITE, title: t.filter_favourites)
  ];

  @override
  List<MomentFilter> getFilters() {
    return _filters;
  }
}
