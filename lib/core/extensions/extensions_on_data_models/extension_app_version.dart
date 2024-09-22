import 'package:get/get.dart';

import '../../../components/failures/local_exception.dart';
import '../../../components/storage/app_local_storage.dart';
import '../../../features/versions/models/app_version/app_version.dart';
import '../../../ui_kit/dialogs/specific_dialogs/exceptions_dialog.dart';

extension ExtensionAppVersionRxStorage on Rx<AppVersionsList> {
  saveOnStorage() => value.saveOnStorage();
  Rx<AppVersionsList> loadFromStorage() => value.loadFromStorage().obs;
}

extension ExtensionAppVersionStorage on AppVersionsList {
  Future<void> saveOnStorage() async => await AppLocalStorage.to.saveAppVersions(appVersions: this);
  AppVersionsList loadFromStorage() =>
      AppLocalStorage.to.loadAppVersions().fold((l) => AppExceptionsDialog.local(exception: l), (r) => r);
}

extension ExtensionAppVersionRxClear on Rx<AppVersionsList> {
  Rx<AppVersionsList> clearData() => value.clearData();
}

extension ExtensionAppVersionClear on AppVersionsList {
  clearData() => AppVersionsList().saveOnStorage();
}
