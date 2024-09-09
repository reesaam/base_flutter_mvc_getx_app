import '../../../core/core_functions.dart';
import '../../../core/failures/general_exception.dart';
import '../../../core/failures/local_exception.dart';
import '../../../core/failures/network_exception.dart';
import '../../components/dialogs/app_alert_dialogs.dart';

class AppExceptionsDialog<E extends GeneralException> extends AppAlertDialogs {
  local({required LocalException exception, String? message, int? statusCode, Function()? onTap}) async {
    await AppAlertDialogs()
        .withOk(title: statusCode?.toString() ?? exception.statusCode?.toString(), text: message ?? exception.message, onTapOk: onTap ?? popPage);
  }

  remote({required NetworkException exception, String? message, int? statusCode, Function()? onTap}) async {
    await AppAlertDialogs()
        .withOk(title: statusCode?.toString() ?? exception.statusCode?.toString(), text: message ?? exception.message, onTapOk: onTap ?? popPage);
  }
}
