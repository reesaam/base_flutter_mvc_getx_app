import 'package:dartz/dartz.dart';

import '../../../../core/network/dio_functions.dart';
import '../../../../data/info/app_apis.dart';
import '../../../../data/storage/app_local_storage.dart';
import '../models/app_version/app_version.dart';
import 'versions_repository.dart';

class VersionsRepositoryImpl implements VersionsRepository {
  const VersionsRepositoryImpl();

  @override
  Future<Either<Exception, AppVersionsList>> getVersionsRemote() async => await DioFunctions.get<AppVersionsList>(url: AppAPIs.apiGetVersions);

  @override
  Future<Either<Exception, AppVersionsList>> getVersionsLocal() async => AppLocalStorage.to.loadAppVersions();
}
