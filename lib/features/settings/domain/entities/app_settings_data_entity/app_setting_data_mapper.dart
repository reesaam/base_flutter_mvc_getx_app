import '../../../data/models/app_settings_data_model/app_setting_data_model.dart';
import 'app_setting_data_entity.dart';

extension OnAppSettingDataEntity on AppSettingDataEntity {
  AppSettingDataModel get mapper => AppSettingDataModel(darkMode: darkMode, language: language);
}

extension OnAppSettingDataModel on AppSettingDataModel {
  AppSettingDataEntity get mapper => AppSettingDataEntity(darkMode: darkMode, language: language);
}

extension OnAppSettingDataEntityNull on AppSettingDataEntity? {
  AppSettingDataModel get mapper => this?.mapper ?? const AppSettingDataModel();
}

extension OnAppSettingDataModelNull on AppSettingDataModel? {
  AppSettingDataEntity get mapper => this?.mapper ?? const AppSettingDataEntity();
}
