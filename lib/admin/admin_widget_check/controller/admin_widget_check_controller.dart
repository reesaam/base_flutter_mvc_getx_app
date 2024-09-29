import '../../../core/core_elements/core_controller.dart';
import '../../../ui_kit/dialogs/app_alert_dialogs.dart';
import '../../../core/core_functions.dart';
import '../../../core/core_resources/page_details.dart';

class AdminWidgetCheckController extends CoreController {
  @override
  void dataInit() {
    // clearAppData();
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails.adminWidgetCheckPage;
  }

  functionCalledDialog() => AppAlertDialogs.withOk(text: 'Function Called', onTapOk: popPage);
}
