import 'package:get/get.dart';

import '../../components/storage/app_local_storage.dart';
import '../../components/storage/app_shared_preferences.dart';
import '../../components/storage/app_storage.dart';

class AppStorageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppSharedPreferences>(() => AppSharedPreferences(), fenix: true);
    Get.lazyPut<AppStorage>(() => AppStorage(), fenix: true);
    Get.lazyPut<AppLocalStorage>(() => AppLocalStorage(), fenix: true);
  }
}
