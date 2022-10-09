import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/moment.dart';
import '../moments/moments_source.dart';
import 'favourite_presenter.dart';
import 'favourite_presenter_impl.dart';

class FavouriteButtonWidget extends StatelessWidget {
  FavouriteButtonWidget({super.key, required this.moment});

  final Moment moment;

  final FavouritePresenter _presenter = FavouritePresenterImpl();

  @override
  Widget build(BuildContext context) {
    final MomentsSource source =
        Provider.of<MomentsSource>(context, listen: false);
    return IconButton(
        onPressed: () => _presenter.updateFavouriteState(
            favourite: !moment.favourite,
            moment: moment,
            momentsSource: source),
        icon: Icon(_getIcon(moment.favourite)));
  }

  IconData _getIcon(bool favourite) {
    if (favourite) {
      return Icons.favorite;
    } else {
      return Icons.favorite_border_outlined;
    }
  }
}
