import '../../../core/core_elements/core_controller.dart';
import '../../../core/core_resources/page_details.dart';
import '../../../core/core_resources/countries.dart';
import '../../../core/extensions/extensions_on_enums/extension_on_countries.dart';

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
