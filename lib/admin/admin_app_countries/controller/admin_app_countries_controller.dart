import '../../../core/core_elements/core_controller.dart';
import '../../../core/core_models/core_models/app_page_detail/app_page_detail.dart';
import '../../../core/core_resources/page_details.dart';
import '../../../core/core_resources/countries.dart';
import '../../../core/extensions/extensions_on_enums/extension_on_countries.dart';

class AdminAppCountriesController extends CoreController {
  List<AppCountry> countries = AppCountry.values.getSortedCountriesList;

  @override
  AppPageDetail get pageDetail => AppPageDetails.adminAppCountriesPage;
}
