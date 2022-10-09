import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/ui_settings.dart';
import '../pager/snap_position_source.dart';

class PagerNavigateUpWidget extends StatelessWidget {
  const PagerNavigateUpWidget({super.key, required this.onPressedButton});

  final VoidCallback onPressedButton;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: AlignmentDirectional.bottomEnd,
        child: Padding(
            padding: const EdgeInsets.only(
                right: MEDIUM_PADDING, bottom: EXTRA_SMALL_PADDING),
            child: Consumer<SnapPositionSource>(
                builder: (_, SnapPositionSource snapPositionSource, __) {
              return Visibility(
                  visible: snapPositionSource.getCurrentSnapPosition() >=
                      NAVIGATE_UP_SNAP_INDEX_VISIBILITY,
                  child: IconButton(
                      icon: const Icon(Icons.keyboard_arrow_up, size: 32),
                      onPressed: () => onPressedButton()));
            })));
  }
}
