import 'package:dartz/dartz.dart';

import '../../../core/failures/local_exception.dart';
import '../../../data/storage/app_local_storage.dart';
import '../models/app_version/app_version.dart';

class VersionsLocalDataSource {
  Future<Either<LocalException, AppVersionsList>> getVersions() async => AppLocalStorage.to.loadAppVersions();
}