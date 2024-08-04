import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

extension GetPermissionName on Permission {
  String get getName => toString().split('.').last.capitalizeFirst ?? 'Unknown';
}

extension GetStatusName on PermissionStatus {
  String get getName => name.split('.').last.capitalizeFirst ?? 'Unknown';
}