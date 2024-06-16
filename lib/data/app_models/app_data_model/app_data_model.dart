import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../features/settings/model/models/app_setting_data/app_setting_data.dart';
import '../../../features/version/model/models/app_version/app_version.dart';
import '../../resources/app_enums.dart';

part 'app_data_model.freezed.dart';
part 'app_data_model.g.dart';

@freezed
class AppDataModel with _$AppDataModel {
  const factory AppDataModel({
    final AppDataVersions? version,
    final AppVersionsList? appVersions,
    final AppSettingData? settings,
  }) = _AppDataModel;

  factory AppDataModel.fromJson(Map<String, dynamic> json) => _$AppDataModelFromJson(json);
}
