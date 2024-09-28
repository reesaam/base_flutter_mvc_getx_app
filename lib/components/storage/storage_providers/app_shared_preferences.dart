import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/core_functions.dart';
import '../../../core/core_resources/core_enums.dart';
import '../../failures/local_exception.dart';
import '../app_storage_module_abstraction.dart';

class AppSharedPreferences extends AppStorageModuleAbstraction {
  static AppSharedPreferences get to => Get.find();

  @override
  Future<Either<LocalException, bool>> saveData<T>({required AppStorageKeys key, required T data}) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      String jsonData = json.encode(data);
      final result = await sp.setString(key.name, jsonData);
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
  Future<Either<LocalException, T>> loadData<T>({required AppStorageKeys key}) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      String? data = sp.getString(key.name);
      final result = data == null ? null : json.decode(data);
      appLogPrint('Data Loaded Successfully from ${key.name}');
      return Right(result);
    } on LocalException catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    } catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    }
  }

  void clearData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }

  @override
  Future<Either<LocalException, bool>> clearSpecificKey(AppStorageKeys key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      final response = await sp.remove(key.name);
      appLogPrint('Data Removed Successfully from ${key.name}');
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
  Future<Either<LocalException, bool>> clearStorage() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      final response = await sp.clear();
      appLogPrint('Storage Cleared Successfully');
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
  Future<Either<LocalException, bool>> hasData({required AppStorageKeys key}) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      final response = sp.get(key.name);
      return Right(response != null);
    } on LocalException catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    } catch (ex) {
      appLogPrint('Local Exception Occurred : $ex');
      return Left(LocalException.handleResponse(ex));
    }
  }
}
