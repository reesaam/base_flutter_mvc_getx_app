import '../../../app/components/dialogs/app_alert_dialogs.dart';
import '../../../core/core_functions.dart';
import '../../../core/elements/core_controller.dart';
import '../../../data/info/app_page_details.dart';

class AdminDataFormatCheckController extends CoreController {

  @override
  void dataInit() {
    // clearAppData();
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails().adminDataFormatCheckPage;
  }

  functionCalledDialog() => AppAlertDialogs().withOk(text: 'Function Called', onTapOk: popPage);
}
