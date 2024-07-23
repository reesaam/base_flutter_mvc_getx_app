import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../features/update/data/update_remote_data_source.dart';
import '../../features/versions/data/versions_local_data_source.dart';
import '../../features/versions/data/versions_remote_data_source.dart';


class AppRepositoriesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dio>(() => Dio(), fenix: true);
    Get.lazyPut<UpdateRemoteDataSource>(() => UpdateRemoteDataSource(), fenix: true);
    Get.lazyPut<VersionsLocalDataSource>(() => VersionsLocalDataSource(), fenix: true);
    Get.lazyPut<VersionsRemoteDataSource>(() => VersionsRemoteDataSource(), fenix: true);
  }
}
