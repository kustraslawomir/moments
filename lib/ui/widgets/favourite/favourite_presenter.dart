import '../../../data/models/moment.dart';
import '../moments/moments_source.dart';

abstract class FavouritePresenter {
  void updateFavouriteState(
      {required bool favourite,
      required Moment moment,
      required MomentsSource momentsSource});
}
