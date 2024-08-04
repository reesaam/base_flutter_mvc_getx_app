import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../data/info/app_info.dart';
import '../../../../../../data/resources/app_enums.dart';

part 'app_version.freezed.dart';
part 'app_version.g.dart';

@freezed
class AppVersion with _$AppVersion {
  const factory AppVersion({
    required final String version,
    final List<String>? changes,
    final AppVersionTypes? versionType,
  }) = _AppVersion;

  factory AppVersion.fromJson(Map<String, dynamic> json) => _$AppVersionFromJson(json);

  factory AppVersion.createEmpty() => AppVersion(version: AppInfo.currentVersion.version);
}

@freezed
class AppVersionsList with _$AppVersionsList {
  factory AppVersionsList({@Default(<AppVersion>[]) List<AppVersion> versionsList}) = _AppVersionsList;

  factory AppVersionsList.fromJson(Map<String, dynamic> json) => _$AppVersionsListFromJson(json);
}
