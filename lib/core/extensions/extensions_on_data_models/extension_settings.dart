import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../components/failures/local_exception.dart';
import '../../../components/storage/app_storage_module.dart';
import '../../../ui_kit/dialogs/specific_dialogs/exceptions_dialog.dart';
import '../../core_resources/core_enums.dart';
import '../../../features/settings/models/app_settings_data/app_setting_data.dart';

extension ExtensionAppSettingsRxStorage on Rx<AppSettingData> {
  void saveOnStorage() async => await AppStorage.to.saveSettings(settings: value);
  Rx<AppSettingData> loadFromStorage() => value.loadFromStorage().obs;
}

extension ExtensionAppSettingsStorage on AppSettingData {
  void saveOnStorage() async => await AppStorage.to.saveSettings(settings: this);
  AppSettingData loadFromStorage() {
    AppSettingData? result;
    Either<LocalException, AppSettingData?>? response;

    AppStorage.to.loadSettings().then((value) => response = value);
    response?.fold((l) => AppExceptionsDialog.local(exception: l), (r) => result = r);
    return result ?? const AppSettingData();
  }
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
