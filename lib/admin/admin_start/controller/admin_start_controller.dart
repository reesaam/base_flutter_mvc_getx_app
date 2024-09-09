import '../../../core/elements/core_controller.dart';
import '../../../data/info/app_page_details.dart';
import '../../../data/shared_models/core_models/app_page_detail/app_page_detail.dart';

class AdminStartController extends CoreController {
  List<AppPageDetail> pages = List<AppPageDetail>.empty(growable: true);

  @override
  void dataInit() {
    // clearAppData();
    pages = AppPageDetails().listAdminPages;
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails().adminStartPage;
  }
}
