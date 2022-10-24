import '../../../../data/filter/filter.dart';
import '../../../../data/models/moment.dart';
import '../../../../i18n/strings.g.dart';
import 'moments_pager_presenter.dart';
import 'snap_position_source.dart';

class MomentsPagerPresenterImpl extends MomentsPagerPresenter {
  final SnapPositionSource _snapPositionSource = SnapPositionSource();

  @override
  void updateCurrentSnapPosition(int snapPosition) {
    _snapPositionSource.updateSnapPosition(snapPosition);
  }

  @override
  SnapPositionSource getCurrentSnapPositionSource() {
    return _snapPositionSource;
  }

  @override
  List<Moment> filter(Filter filter, List<Moment> moments) {
    final List<Moment> filteredMoments = List<Moment>.empty(growable: true);

    switch (filter) {
      case Filter.FAVOURITE:
        filteredMoments
            .addAll(moments.where((Moment element) => element.favourite));
        break;
      case Filter.MENTAL_HEALTH:
        filteredMoments
            .addAll(moments.where((Moment element) => element.mentalHealth));
        break;
      case Filter.FULFILLMENT:
        filteredMoments
            .addAll(moments.where((Moment element) => element.fulfillment));
        break;
      case Filter.AWARENESS:
        filteredMoments
            .addAll(moments.where((Moment element) => element.awareness));
        break;
      case Filter.JOY:
        filteredMoments.addAll(moments.where((Moment element) => element.joy));
        break;
      case Filter.HABIT:
        filteredMoments
            .addAll(moments.where((Moment element) => element.habit));
        break;
      case Filter.GOAL:
        filteredMoments.addAll(moments.where((Moment element) => element.goal));
        break;
      case Filter.IMPROVEMENT:
        filteredMoments
            .addAll(moments.where((Moment element) => element.improvement));
        break;
      case Filter.DISCOVERING:
        filteredMoments
            .addAll(moments.where((Moment element) => element.discovering));
        break;
      case Filter.RELATIONSHIP:
        filteredMoments
            .addAll(moments.where((Moment element) => element.relationship));
        break;
      case Filter.HEALTH:
        filteredMoments
            .addAll(moments.where((Moment element) => element.mentalHealth));
        break;
    }
    return filteredMoments;
  }

  @override
  String getFilterTag(Filter filter) {
    switch (filter) {
      case Filter.FAVOURITE:
        return t.filter_favourites;
      case Filter.MENTAL_HEALTH:
        return t.mental_health;
      case Filter.FULFILLMENT:
        return t.fulfillment;
      case Filter.AWARENESS:
        return t.awareness;
      case Filter.JOY:
        return t.joy;
      case Filter.HABIT:
        return t.habit;
      case Filter.GOAL:
        return t.goal;
      case Filter.IMPROVEMENT:
        return t.improvement;
      case Filter.DISCOVERING:
        return t.discovering;
      case Filter.RELATIONSHIP:
        return t.relationship;
      case Filter.HEALTH:
        return t.health;
    }
  }
}
