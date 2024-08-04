import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_statistics_detailed_data.freezed.dart';
part 'app_statistics_detailed_data.g.dart';

@freezed
class AppStatisticsDetailedData with _$AppStatisticsDetailedData {
  const factory AppStatisticsDetailedData({
    final int? pageOpens,
    final int? apiCalls,
  }) = _AppStatisticsDetailedData;

  factory AppStatisticsDetailedData.fromJson(Map<String, dynamic> json) => _$AppStatisticsDetailedDataFromJson(json);

  factory AppStatisticsDetailedData.init() {
    AppStatisticsDetailedData data = const AppStatisticsDetailedData(pageOpens: 0, apiCalls: 0);
    return data;
  }
}

@unfreezed
class AppStatisticsDetailedDataList with _$AppStatisticsDetailedDataList {
  factory AppStatisticsDetailedDataList({@Default(<AppStatisticsDetailedData>[]) List<AppStatisticsDetailedData> detailedDataList}) = _AppStatisticsDetailedDataList;

  factory AppStatisticsDetailedDataList.fromJson(Map<String, dynamic> json) => _$AppStatisticsDetailedDataListFromJson(json);
}