import '../../../data/constants/preference_keys.dart';
import '../../../data/preferences/app_preferences_repository.dart';
import 'introduction_presenter.dart';

class IntroductionPresenterImpl extends IntroductionPresenter {
  @override
  Future<bool> isIntroductionEnabled() {
    return AppPreferencesRepository.instance.getBoolean(
        key: ConfigurationKeys.DISPLAY_INTRODUCTION, defaultValue: true);
  }

  @override
  void disableIntroduction() {
    AppPreferencesRepository.instance.storeBoolean(
        key: ConfigurationKeys.DISPLAY_INTRODUCTION, value: false);
  }
}
