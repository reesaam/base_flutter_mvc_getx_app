import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/resources/app_enums.dart';

part 'app_setting_data.freezed.dart';
part 'app_setting_data.g.dart';

@freezed
class AppSettingData with _$AppSettingData {
  const factory AppSettingData({
    @Default(false) bool darkMode,
    @Default(AppLanguages.english) AppLanguages language,
  }) = _AppSettingData;

  factory AppSettingData.fromJson(Map<String, dynamic> json) => _$AppSettingDataFromJson(json);

  factory AppSettingData.createEmpty() => const AppSettingData(
        language: AppLanguages.english,
        darkMode: false,
      );
}

@unfreezed
class AppSettingDataList with _$AppSettingDataList {
  factory AppSettingDataList({@Default(<AppSettingData>[]) List<AppSettingData> appSettingsDataList}) = _AppSettingDataList;

  factory AppSettingDataList.fromJson(Map<String, dynamic> json) => _$AppSettingDataListFromJson(json);
}
