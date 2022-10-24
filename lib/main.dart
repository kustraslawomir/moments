import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moments/ui/styles/colors.dart';
import 'package:moments/ui/widgets/moments/moments_presenter.dart';
import 'package:moments/ui/widgets/moments/moments_presenter_impl.dart';
import 'package:moments/ui/widgets/moments/moments_source.dart';
import 'package:provider/provider.dart';

import 'i18n/strings.g.dart';
import 'ui/widgets/introduction/introduction_presenter.dart';
import 'ui/widgets/introduction/introduction_presenter_impl.dart';
import 'ui/widgets/introduction/introduction_widget.dart';
import 'ui/widgets/moments/moments_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _setLocale();
  runApp(const MomentsApp());
}

void _setLocale() {
  LocaleSettings.useDeviceLocale();
}

class MomentsApp extends StatefulWidget {
  const MomentsApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<MomentsApp> {
  final IntroductionPresenter _presenter = IntroductionPresenterImpl();
  final MomentsPresenter _momentsPresenter = MomentsPresenterImpl();

  @override
  void initState() {
    super.initState();
    _momentsPresenter.loadMoments();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MomentsSource>(
        create: (_) => _momentsPresenter.getMomentsSource(),
        child: MaterialApp(
            theme: _buildTheme(Brightness.dark),
            home: FutureBuilder<bool>(
                future: _presenter.isIntroductionEnabled(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  return _buildWidget(snapshot);
                })));
  }

  ThemeData _buildTheme(Brightness brightness) {
    final ThemeData baseTheme = ThemeData(
        brightness: brightness,
        primarySwatch: CustomColors.materialAccentColor);
    return baseTheme.copyWith(
        textTheme: GoogleFonts.nunitoTextTheme(baseTheme.textTheme),
        backgroundColor: Colors.black87);
  }

  Widget _buildWidget(AsyncSnapshot<bool> snapshot) {
    final bool? isIntroductionEnabled = snapshot.data;
    if (isIntroductionEnabled == null) {
      return Container();
    }

    if (isIntroductionEnabled) {
      return IntroductionWidget();
    }

    return const MomentsPage();
  }
}
