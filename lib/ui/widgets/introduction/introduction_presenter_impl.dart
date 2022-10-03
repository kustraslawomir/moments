import '../../../data/repository/local/app_configuration_repository.dart';
import '../../../data/repository/local/configuration_keys.dart';
import 'introduction_presenter.dart';

class IntroductionPresenterImpl extends IntroductionPresenter {
  @override
  Future<bool> isIntroductionEnabled() {
    return AppConfigurationRepository.instance.getBoolean(
        key: ConfigurationKeys.DISPLAY_INTRODUCTION, defaultValue: true);
  }

  @override
  void disableIntroduction() {
    AppConfigurationRepository.instance.storeBoolean(
        key: ConfigurationKeys.DISPLAY_INTRODUCTION, value: false);
  }
}
