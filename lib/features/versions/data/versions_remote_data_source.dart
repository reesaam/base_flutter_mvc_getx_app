import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../core/failures/network_exception.dart';
import '../../../core/network/dio_functions.dart';
import '../../../data/info/app_apis.dart';
import '../models/app_version/app_version.dart';

class VersionsRemoteDataSource {

  Future<Either<NetworkException, AppVersionsList>> getVersions() async => await DioFunctions.get<AppVersionsList>(url: AppAPIs.apiGetVersions);
}