import 'package:flutter/material.dart';

import 'i18n/strings.g.dart';
import 'ui/widgets/introduction/introduction_presenter.dart';
import 'ui/widgets/introduction/introduction_presenter_impl.dart';
import 'ui/widgets/introduction/introduction_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _setLocale();
  runApp(MomentsApp());
}

void _setLocale() {
  LocaleSettings.useDeviceLocale();
}

class MomentsApp extends StatelessWidget {
  MomentsApp({super.key});

  final IntroductionPresenter _presenter = IntroductionPresenterImpl();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder<bool>(
            future: _presenter.isIntroductionEnabled(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.data ?? false) {
                return IntroductionWidget();
              } else {
                return const Text('lool');
              }
            }));
  }
}
