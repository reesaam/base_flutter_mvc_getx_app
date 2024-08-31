import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../features/settings/models/app_settings_data/app_setting_data.dart';
import '../../../../features/versions/models/app_version/app_version.dart';
import '../../../resources/app_enums.dart';
import '../app_statistics_data/app_statistics_data.dart';

part 'app_data.freezed.dart';
part 'app_data.g.dart';

@freezed
class AppData with _$AppData {
  const factory AppData({
    final AppDataVersions? dataVersion,
    final AppVersionsList? appVersions,
    final AppSettingData? settings,
    final AppStatisticsData? statisticsData,
  }) = _AppData;

  factory AppData.fromJson(Map<String, dynamic> json) => _$AppDataFromJson(json);
}
