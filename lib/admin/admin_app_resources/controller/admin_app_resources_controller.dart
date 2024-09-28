import '../../../core/core_elements/core_controller.dart';
import '../../../core/core_resources/page_details.dart';

class AdminAppResourcesController extends CoreController {
  @override
  void dataInit() {
    // clearAppData();
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails().adminAppResourcesPage;
  }
}
