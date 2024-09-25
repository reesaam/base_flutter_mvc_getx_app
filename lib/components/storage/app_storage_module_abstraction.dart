import 'package:dartz/dartz.dart';

import '../../core/core_resources/core_enums.dart';
import '../failures/local_exception.dart';

abstract class AppStorageModuleAbstraction {
  Future<Either<LocalException, bool>> clearStorage();
  Future<Either<LocalException, bool>> clearSpecificKey(AppStorageKeys key);
  Future<Either<LocalException, bool>> hasData({required AppStorageKeys key});
  Future<Either<LocalException, bool>> saveData<T>({required AppStorageKeys key, required T data});
  Future<Either<LocalException, T>> loadData<T>({required AppStorageKeys key});
}