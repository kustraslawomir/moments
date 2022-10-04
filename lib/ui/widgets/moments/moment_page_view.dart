import 'package:flutter/material.dart';

import '../../../data/models/moment.dart';

class MomentPageView extends StatelessWidget {
  const MomentPageView({super.key, required this.moment});

  final Moment moment;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
          children: <Widget>[Text(moment.title), Text(moment.description)]),
    );
  }
}
