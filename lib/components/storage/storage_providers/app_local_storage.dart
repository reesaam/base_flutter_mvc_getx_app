import 'package:dartz/dartz.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../failures/local_exception.dart';
import '../../../core/core_resources/core_enums.dart';
import '../../../core/core_functions.dart';
import '../app_storage_module_abstraction.dart';
import 'local_storage_service.dart';

@GetPut.component()
class AppLocalStorage implements AppStorageModuleAbstraction {
  final String _keyLocalStorage = 'Local Storage';
  final _service = LocalStorageService();

  @override
  Future<Either<LocalException, bool>> clearStorage() async {
    bool result = true;
    try {
      for (var key in AppStorageKeys.values) {
        var response = await clearSpecificKey(key);
        response.fold((l) => result = false, (r) => null);
      }
      result ? appLogPrint('All App Data Cleared Successfully') : appLogPrint('App Data Clearance was not Successful');
      return Right(result);
    } on LocalException catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    } catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    }
  }

  @override
  Future<Either<LocalException, bool>> clearSpecificKey(AppStorageKeys key) async {
    try {
      var result = _service.remove(key.name);
      appLogPrint('Data Removed Successfully from ${key.name}');
      return Right(result);
    } on LocalException catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    } catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    }
  }

  @override
  Future<Either<LocalException, bool>> hasData({required AppStorageKeys key}) async {
    try {
      bool response = _service.hasData(key.name);
      return Right(response);
    } on LocalException catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    } catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    }
  }

  @override
  Future<Either<LocalException, T>> loadData<T>({required AppStorageKeys key}) async {
    try {
      T data = _service.read(key.name);
      appLogPrint('Data Loaded Successfully from ${key.name}');
      return Right(data);
    } on LocalException catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    } catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    }
  }

  @override
  Future<Either<LocalException, bool>> saveData<T>({required AppStorageKeys key, required T data}) async {
    try {
      await _service.write(key.name, data);
      appLogPrint('Data Saved Successfully on ${key.name}');
      return const Right(true);
    } on LocalException catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    } catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    }
  }
}