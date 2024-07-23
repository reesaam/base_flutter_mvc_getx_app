import 'package:get/get.dart';

import '../../../data/resources/app_enums.dart';
import '../../../data/storage/app_local_storage.dart';
import '../../../features/settings/models/app_settings_data/app_setting_data.dart';

extension RxStorage on Rx<AppSettingData> {
  void get saveOnStorage async => await AppLocalStorage.to.saveSettings(settings: value);
  Rx<AppSettingData> get loadFromStorage => value.loadFromStorage.obs;
}

extension Storage on AppSettingData {
  void get saveOnStorage async => await AppLocalStorage.to.saveSettings(settings: this);
  AppSettingData get loadFromStorage => AppLocalStorage.to.loadSettings().fold((l) => AppSettingData.createEmpty(), (r) => r);
}

extension RxClear on Rx<AppSettingData> {
  Rx<AppSettingData> get clearData => value.clearData.obs;
}

extension Clear on AppSettingData {
  AppSettingData get clearData => AppSettingData.createEmpty();
}

extension RxLanguagesEntity on Rx<AppSettingData> {
  changeLanguage(AppLanguages language) => value.changeLanguage(language);
}

extension Languages on AppSettingData {
  changeLanguage(AppLanguages lang) => copyWith(language: lang).saveOnStorage;
}