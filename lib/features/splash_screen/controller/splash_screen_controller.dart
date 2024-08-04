import '../../../app/components/dialogs/app_alert_dialogs.dart';
import '../../../core/app_localization.dart';
import '../../../core/app_routing/app_routing.dart';
import '../../../core/core_functions.dart';
import '../../../core/elements/core_controller.dart';
import '../../../data/info/app_info.dart';
import '../../../data/info/app_page_details.dart';
import '../../../data/resources/app_logos.dart';
import '../../../data/statistics/app_statistics.dart';

class SplashScreenController extends CoreController {
  late bool internetStatus;
  late String availableUpdate = AppInfo.currentVersion.version;
  late String permissionsStatus;

  late String logoSource;
  late String appName;
  late String appVersion;

  @override
  void dataInit() async {
    // clearAppData();
    // permissionsStatus = await AppPermissions.to.checkAllPermissions();
    // internetStatus = await ConnectionChecker.to.checkInternet();
    // internetStatus ? availableUpdate = await checkAvailableVersion() : noInternetConnectionSnackBar();
    // availableUpdate = await checkAvailableVersion();
    AppStatistics.to.increaseLaunch();

    printAllData();
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails().splashScreen;
    logoSource = AppLogos.appLogo;
    appName = AppInfo.appName;
    appVersion = '${Texts.to.version}: ${AppInfo.currentVersion.version}';
  }

  @override
  void onReadyFunction() {
    goToNextPage();
  }

  void goToNextPage() async {
    await Future.delayed(const Duration(seconds: 4));
    availableUpdate == AppInfo.currentVersion.version ? goToHomePage() : _showUpdateDialog();
  }

  _showUpdateDialog() => AppAlertDialogs().withYesNo(
        title: Texts.to.updateNewVersion,
        text: Texts.to.updateApprove,
        onTapNo: goToHomePage,
        onTapYes: _goToUpdate,
      );

  _goToUpdate() {
    goToHomePage();
    goToUpdatePage();
  }
}
