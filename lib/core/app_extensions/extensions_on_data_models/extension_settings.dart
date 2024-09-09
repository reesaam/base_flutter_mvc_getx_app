import 'package:get/get.dart';

import '../../../app/functional_components/specific_dialogs/exceptions_dialog.dart';
import '../../../data/resources/app_enums.dart';
import '../../../data/storage/app_local_storage.dart';
import '../../../features/settings/models/app_settings_data/app_setting_data.dart';
import '../../failures/local_exception.dart';

extension ExtensionAppSettingsRxStorage on Rx<AppSettingData> {
  void saveOnStorage() async => await AppLocalStorage.to.saveSettings(settings: value);
  Rx<AppSettingData> loadFromStorage() => value.loadFromStorage().obs;
}

extension ExtensionAppSettingsStorage on AppSettingData {
  void saveOnStorage() async => await AppLocalStorage.to.saveSettings(settings: this);
  AppSettingData loadFromStorage() =>
      AppLocalStorage.to.loadSettings().fold((l) => AppExceptionsDialog<LocalException>().local(exception: l), (r) => r);
}

extension ExtensionAppSettingsRxClear on Rx<AppSettingData> {
  Rx<AppSettingData> clearData() => value.clearData().obs;
}

extension ExtensionAppSettingsClear on AppSettingData {
  AppSettingData clearData() => const AppSettingData();
}

extension ExtensionAppSettingsRxLanguagesEntity on Rx<AppSettingData> {
  changeLanguage(AppLanguages language) => value.changeLanguage(language);
}

extension ExtensionAppSettingsLanguages on AppSettingData {
  changeLanguage(AppLanguages lang) => copyWith(language: lang).saveOnStorage();
}
