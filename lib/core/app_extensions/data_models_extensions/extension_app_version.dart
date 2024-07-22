import 'package:get/get.dart';

import '../../../data/storage/app_local_storage.dart';
import '../../../features/versions/models/app_version/app_version.dart';

extension RxStorage on Rx<AppVersionsList> {
  get saveOnStorage => value.saveOnStorage;
  Rx<AppVersionsList> get loadFromStorage => value.loadFromStorage.obs;
}

extension Storage on AppVersionsList {
  Future<void> get saveOnStorage async => await AppLocalStorage.to.saveAppVersions(appVersions: this);
  AppVersionsList get loadFromStorage => AppLocalStorage.to.loadAppVersions().fold((l) => AppVersionsList(), (r) => r);
}

extension RxClear on Rx<AppVersionsList> {
  Rx<AppVersionsList> get clearData => value.clearData;
}

extension Clear on AppVersionsList {
  get clearData => AppVersionsList().saveOnStorage;
}
