import 'package:dartz/dartz.dart';

import '../../../../core/failures/local_exception.dart';
import '../models/app_version/app_version.dart';

abstract class VersionsRepository {
  Future<Either<Exception, AppVersionsList>> getVersionsRemote();
  Future<Either<Exception, AppVersionsList>> getVersionsLocal();
}