import 'package:get/get.dart';

import '../../../data/resources/app_enums.dart';
import '../../../data/storage/app_local_storage.dart';
import '../../../features/settings/model/models/app_setting_data/app_setting_data.dart';

extension RxLanguages on Rx<AppSettingData> {
  changeLanguage(AppLanguages language) => value.changeLanguage(language);
}

extension Languages on AppSettingData {
  changeLanguage(AppLanguages lang) => copyWith(language: lang).saveOnStorage;
}

extension RxStorage on Rx<AppSettingData> {
  get saveOnStorage => value.saveOnStorage;
  Rx<AppSettingData> get loadFromStorage => value.loadFromStorage.obs;
}

extension Storage on AppSettingData {
  Future<void> get saveOnStorage async => await AppLocalStorage.to.saveSettings(settings: this);
  AppSettingData get loadFromStorage => AppLocalStorage.to.loadSettings().fold((l) => AppSettingData.createEmpty(), (r) => r);
}

extension RxClear on Rx<AppSettingData> {
  Rx<AppSettingData> get clearData => value.clearData;
}

extension Clear on AppSettingData {
  get clearData => AppSettingData.createEmpty().saveOnStorage;
}