import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/moment.dart';
import '../../styles/styles.dart';
import '../../utils/ui_settings.dart';
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
    return Padding(
        padding: const EdgeInsets.only(right: SMALL_PADDING),
        child: GestureDetector(
            onTap: () => _presenter.updateFavouriteState(
                favourite: !moment.favourite,
                moment: moment,
                momentsSource: source),
            child: Icon(_getIcon(moment.favourite),
                size: MOMENT_TITLE_FONT_SIZE)));
  }

  IconData _getIcon(bool favourite) {
    if (favourite) {
      return Icons.favorite_sharp;
    } else {
      return Icons.favorite_outline_sharp;
    }
  }
}
