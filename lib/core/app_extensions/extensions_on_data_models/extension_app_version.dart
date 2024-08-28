import 'package:get/get.dart';

import '../../../app/functional_components/specific_dialogs/exceptions_dialog.dart';
import '../../../data/storage/app_local_storage.dart';
import '../../../features/versions/models/app_version/app_version.dart';
import '../../failures/local_exception.dart';

extension ExtensionAppVersionRxStorage on Rx<AppVersionsList> {
  saveOnStorage() => value.saveOnStorage;
  Rx<AppVersionsList> loadFromStorage() => value.loadFromStorage().obs;
}

extension ExtensionAppVersionStorage on AppVersionsList {
  Future<void> saveOnStorage() async => await AppLocalStorage.to.saveAppVersions(appVersions: this);
  AppVersionsList loadFromStorage() => AppLocalStorage.to.loadAppVersions().fold((l) => AppExceptionsDialog<LocalException>().local(exception: l), (r) => r);
}

extension ExtensionAppVersionRxClear on Rx<AppVersionsList> {
  Rx<AppVersionsList> clearData() => value.clearData();
}

extension ExtensionAppVersionClear on AppVersionsList {
  clearData() => AppVersionsList().saveOnStorage;
}
