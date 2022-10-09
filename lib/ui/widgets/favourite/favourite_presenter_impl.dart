import '../../../data/data_source/local/database/moments_database.dart';
import '../../../data/models/moment.dart';
import '../moments/moments_source.dart';
import 'favourite_presenter.dart';

class FavouritePresenterImpl extends FavouritePresenter {
  @override
  void updateFavouriteState(
      {required bool favourite,
      required Moment moment,
      required MomentsSource momentsSource}) {
    final Moment updatedMoment = moment.copy(favourite: favourite);

    MomentsDatabase.instance.updateMoment(updatedMoment);
    momentsSource.updateMoment(updatedMoment);
  }
}
