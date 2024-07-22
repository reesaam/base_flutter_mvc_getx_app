import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../core/network/dio_functions.dart';
import '../../../data/info/app_apis.dart';

class UpdateRemoteDataSource {

  Future<Either<Exception, String>> getDownloadAddress() async => await DioFunctions.get<String>(url: AppAPIs.apiGetUpdateAddress);

  Future<Either<Exception, String>> getAvailableVersion() async => await DioFunctions.get<String>(url: AppAPIs.apiGetVersions);

  Future<Either<Exception, File?>> updateDownload({required String savePath}) async => await DioFunctions.download(url: AppAPIs.apiGetUpdateAPKDownload, savePath: savePath);
}