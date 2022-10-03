import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../i18n/strings.g.dart';
import '../../styles/styles.dart';
import 'introduction_presenter.dart';
import 'introduction_presenter_impl.dart';

class IntroductionWidget extends StatelessWidget {
  IntroductionWidget({super.key});

  final IntroductionPresenter _presenter = IntroductionPresenterImpl();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: _getPages(),
      onDone: _presenter.disableIntroduction,
      showBackButton: true,
      next: const Icon(Icons.navigate_next),
      back: const Icon(Icons.arrow_back),
      done: Text(t.done, style: doneButtonStyle),
    );
  }

  List<PageViewModel> _getPages() {
    return <PageViewModel>[
      PageViewModel(
        title: t.tutorial_page_title_1,
        body: t.tutorial_page_message_1,
        image: const Center(child: Icon(Icons.android)),
      ),
      PageViewModel(
        title: t.tutorial_page_title_2,
        body: t.tutorial_page_message_2,
        image: const Center(child: Icon(Icons.android)),
      )
    ];
  }
}
