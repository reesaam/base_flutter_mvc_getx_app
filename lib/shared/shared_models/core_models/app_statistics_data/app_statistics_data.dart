import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/annotations/freezed_custom_annotation.dart';
import '../../../../core/extensions/extensions_on_data_models/extension_statistics.dart';


part 'app_statistics_data.freezed.dart';
part 'app_statistics_data.g.dart';

@FreezedCustom.model
class AppStatisticsData with _$AppStatisticsData {
  const factory AppStatisticsData({
    final int? launches,
    final int? logins,
    final int? crashes,
    final int? pageOpens,
    final int? apiCalls,
    final DateTime? installDateTime,
    final Duration? installDuration,
  }) = _AppStatisticsData;

  factory AppStatisticsData.fromJson(Map<String, dynamic> json) => _$AppStatisticsDataFromJson(json);

  factory AppStatisticsData.init() {
    AppStatisticsData data = AppStatisticsData(
      launches: 1,
      logins: 0,
      crashes: 0,
      pageOpens: 0,
      apiCalls: 0,
      installDateTime: DateTime.now(),
      installDuration: Duration.zero,
    );
    data.saveOnStorage();
    return data;
  }
}

@FreezedCustom.modelList
class AppStatisticsDataList with _$AppStatisticsDataList {
  factory AppStatisticsDataList({@Default(<AppStatisticsData>[]) List<AppStatisticsData> dataList}) = _AppStatisticsDataList;

  factory AppStatisticsDataList.fromJson(Map<String, dynamic> json) => _$AppStatisticsDataListFromJson(json);
}
