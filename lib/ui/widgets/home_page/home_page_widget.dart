import 'package:flutter/material.dart';

import '../moments/pager/moments_pager_widget.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MomentsPagerWidget(),
    );
  }
}
