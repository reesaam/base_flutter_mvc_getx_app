import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../features/update/model/repositories/update_repositories.dart';
import '../../features/update/model/repositories/update_repositories_impl.dart';
import '../../features/version/model/repositories/versions_repository.dart';
import '../../features/version/model/repositories/versions_repository_impl.dart';

class AppRepositoriesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dio>(() => Dio(), fenix: true);
    Get.lazyPut<UpdateRepository>(() => const UpdateRepositoryImpl(), fenix: true);
    Get.lazyPut<VersionsRepository>(() => const VersionsRepositoryImpl(), fenix: true);
  }
}
