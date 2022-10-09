import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moments/ui/styles/colors.dart';

import 'i18n/strings.g.dart';
import 'ui/widgets/home_page/home_page_widget.dart';
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
        theme: _buildTheme(Brightness.dark),
        home: Scaffold(
            body: FutureBuilder<bool>(
                future: _presenter.isIntroductionEnabled(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.data ?? false) {
                    return IntroductionWidget();
                  } else {
                    return const HomePageWidget();
                  }
                })));
  }

  ThemeData _buildTheme(Brightness brightness) {
    final ThemeData baseTheme = ThemeData(
        brightness: brightness,
        primarySwatch: CustomColors.materialAccentColor);
    return baseTheme.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
    );
  }
}
