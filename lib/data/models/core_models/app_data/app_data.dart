import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../features/settings/models/app_settings_data/app_setting_data.dart';
import '../../../../features/versions/models/app_version/app_version.dart';
import '../../../resources/app_enums.dart';

part 'app_data.freezed.dart';
part 'app_data.g.dart';

@freezed
class AppData with _$AppData {
  const factory AppData({
    final AppDataVersions? version,
    final AppVersionsList? appVersions,
    final AppSettingData? settings,
  }) = _AppData;

  factory AppData.fromJson(Map<String, dynamic> json) => _$AppDataFromJson(json);
}
