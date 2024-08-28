import '../../../core/app_extensions/extensions_on_enums/extension_on_countries.dart';
import '../../../core/elements/core_controller.dart';
import '../../../data/info/app_page_details.dart';
import '../../../data/resources/app_countries.dart';

class AdminAppCountriesController extends CoreController {
  List<AppCountry> countries = AppCountry.values.getSortedCountriesList;

  @override
  void dataInit() {
    // clearAppData();
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails().adminAppCountriesPage;
  }
}
