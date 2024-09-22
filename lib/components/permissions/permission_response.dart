import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/annotations/freezed_custom_annotation.dart';

part 'permission_response.freezed.dart';
part 'permission_response.g.dart';

@FreezedCustom.model
class PermissionResponse with _$PermissionResponse {
  const factory PermissionResponse({
    final PermissionStatus? status,
    final String? permission,
  }) = _PermissionResponse;

  factory PermissionResponse.fromJson(Map<String, dynamic> json) => _$PermissionResponseFromJson(json);
}
