import '../../../../data/filter/filter.dart';
import '../../../../data/models/moment.dart';
import 'snap_position_source.dart';

abstract class MomentsPagerPresenter {
  void updateCurrentSnapPosition(int snapPosition);

  SnapPositionSource getCurrentSnapPositionSource();

  List<Moment> filter(Filter filter, List<Moment> moments);

  String getFilterTag(Filter filter);
}
