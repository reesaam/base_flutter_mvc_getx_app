import '../../../core/elements/core_controller.dart';
import '../../../data/info/app_page_details.dart';
import '../../../data/resources/app_countries.dart';

class AdminAppCountriesController extends CoreController {
  List<AppCountries> countries = List<AppCountries>.empty(growable: true);

  @override
  void dataInit() {
    // clearAppData();
    countries = List<AppCountries>.generate(AppCountries.values.length, (index) => AppCountries.values[index]);
    countries.sort((a, b) => a.countryName!.compareTo(b.countryName!));
    countries.removeWhere((element) => element == AppCountries.utc);
    countries.insert(0, AppCountries.utc);
    countries.removeWhere((element) => element == AppCountries.unknown);
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails().adminAppCountriesPage;
  }
}
