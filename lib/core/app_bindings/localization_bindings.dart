import 'package:get/get.dart';

import '../../core/app_localization.dart';

class AppLocalizationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppLocalization>(() => AppLocalization(), fenix: true);
  }
}
