import 'dart:io';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/app_extensions/data_models_extensions/extension_permission.dart';
import 'permission_response.dart';

class AppPermissions {
  static AppPermissions get to => Get.find();

  AppPermissions() {
    _fillLists();
  }

  final List<Permission> _listPermissions = List<Permission>.empty(growable: true);

  void _fillLists() {
    Platform.isIOS ? null : _listPermissions.add(Permission.location);
    Platform.isIOS ? null : _listPermissions.add(Permission.locationAlways);
    _listPermissions.add(Permission.phone);
    _listPermissions.add(Permission.storage);
    _listPermissions.add(Permission.sms);
    _listPermissions.add(Permission.notification);
    _listPermissions.add(Permission.criticalAlerts);
    _listPermissions.add(Permission.microphone);
    _listPermissions.add(Permission.ignoreBatteryOptimizations);
    _listPermissions.add(Permission.sensors);
    _listPermissions.add(Permission.mediaLibrary);
    _listPermissions.add(Permission.photos);
    _listPermissions.add(Permission.videos);
    _listPermissions.add(Permission.activityRecognition);
  }

  Future<PermissionResponse> askPermission(Permission permission) async {
    PermissionStatus status = await permission.request();
    return _createResponse(permission: permission, status: status);
  }

  Future<List<PermissionResponse>> askPermissionsList(List<Permission> permissions) async {
    List<PermissionResponse> responses = List<PermissionResponse>.empty(growable: true);
    for (var permission in permissions) {
      var status = await askPermission(permission);
      responses.add(status);
    }
    return responses;
  }

  Future<List<PermissionResponse>> askAllPermissions() async => await askPermissionsList(_listPermissions);

  Future<PermissionResponse> checkPermission(Permission permission) async {
    var status = await permission.status;
    return _createResponse(permission: permission, status: status);
  }

  Future<List<PermissionResponse>> checkPermissionsList(List<Permission> permissions) async {
    List<PermissionResponse> responses = List<PermissionResponse>.empty(growable: true);
    for (var permission in permissions) {
      var status = await checkPermission(permission);
      responses.add(status);
    }
    return responses;
  }

  Future<List<PermissionResponse>> checkAllPermissions() async => await checkPermissionsList(_listPermissions);

  PermissionResponse _createResponse({
    required Permission permission,
    required PermissionStatus status,
  }) =>
      PermissionResponse(
        permission: permission.getName,
        status: status,
      );

  List<String> get _listManifestPermissions => [
        'ACCESS_COARSE_LOCATION',
        'ACCESS_FINE_LOCATION',
        'ACCESS_LOCATION_EXTRA_COMMANDS',
        'ACCESS_NETWORK_STATE',
        'ACCESS_NOTIFICATION_POLICY',
        'ACCESS_WIFI_STATE',
        'ANSWER_PHONE_CALLS',
        'CALL_PHONE',
        'READ_CALL_LOG',
        'ANSWER_PHONE_CALLS',
        'CAMERA',
        'CHANGE_WIFI_STATE',
        'INTERNET',
        'READ_EXTERNAL_STORAGE',
        'READ_PHONE_STATE',
        'READ_SMS',
        'SEND_SMS',
        'VIBRATE',
      ];
}
