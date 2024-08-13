import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/app_extensions/extensions_on_data_models/extension_statistics.dart';
import '../app_statistics_detailed_data/app_statistics_detailed_data.dart';

part 'app_statistics_data.freezed.dart';
part 'app_statistics_data.g.dart';

@freezed
class AppStatisticsData with _$AppStatisticsData {
  const factory AppStatisticsData({
    final int? launches,
    final int? logins,
    final int? crashes,
    final DateTime? installDateTime,
    final Duration? installDuration,
    final AppStatisticsDetailedData? detailedData,
  }) = _AppStatisticsData;

  factory AppStatisticsData.fromJson(Map<String, dynamic> json) => _$AppStatisticsDataFromJson(json);

  factory AppStatisticsData.init() {
    AppStatisticsData data = AppStatisticsData(
      launches: 1,
      logins: 0,
      crashes: 0,
      installDateTime: DateTime.now(),
      detailedData: AppStatisticsDetailedData.init(),
    );
    data.saveOnStorage;
    return data;
  }
}

@unfreezed
class AppStatisticsDataList with _$AppStatisticsDataList {
  factory AppStatisticsDataList({@Default(<AppStatisticsData>[]) List<AppStatisticsData> dataList}) = _AppStatisticsDataList;

  factory AppStatisticsDataList.fromJson(Map<String, dynamic> json) => _$AppStatisticsDataListFromJson(json);
}
