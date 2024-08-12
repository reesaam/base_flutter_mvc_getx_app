import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../app/components/dialogs/app_alert_dialogs.dart';
import '../../../app/functional_components/connectivity/connectivity.dart';
import '../../../app/functional_components/file_functions/file_functions.dart';
import '../../../app/functional_components/permissions/permissions.dart';
import '../../../core/app_extensions/data_models_extensions/extension_permission.dart';
import '../../../core/core_functions.dart';
import '../../../core/elements/core_controller.dart';
import '../../../data/info/app_info.dart';
import '../../../data/info/app_page_details.dart';

class AdminTestController extends CoreController {

  @override
  void dataInit() {
    // clearAppData();
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails().adminTestPage;
  }

  ///Internal
  _dialog(String text) async => await AppAlertDialogs().withOk(text: text, onTapOk: popPage);
  String unknownStatus = 'Unknown';

  ///Connections
  internetConnection() async {
    var result = await ConnectionChecker().checkInternet();
    await _dialog(result.toString());
  }

  internetStatus() async {
    var result = await ConnectionChecker().checkInternetStatus();
    await _dialog(result.name.capitalizeFirst ?? unknownStatus);
  }

  checkConnection() async {
    var result = await ConnectionChecker().checkConnection();
    await _dialog(result.name);
  }

  ///Files
  pickFile() async {
    String message = 'File not Imported';
    var result = await AppFileFunctions().pickFile();
    if (result != null) {
      message = 'Picked FileName:\n${result.path.split('/').last}';
    }
    await _dialog(message);
  }

  saveFile() async {
    String message = 'File nor Saved';
    var resultPick = await AppFileFunctions().pickFile();
    if (resultPick != null) {
      var result = await AppFileFunctions().saveFile(fileName: resultPick.path, data: resultPick.readAsBytesSync());
      message = 'Saved FileName:\n${result?.split('/').last ?? unknownStatus}';
    }
    await _dialog(message);
  }

  ///Permissions
  checkAllPermissions() async {
    var result = await AppPermissions.to.checkAllPermissions();
    String response = Texts.to.empty;
    for (var r in result) {
      response = '$response\n${r.permission}: ${r.status?.getName}';
    }
    await _dialog(response);
  }

  askAllPermissions() async {
    var result = await AppPermissions.to.askAllPermissions();
    String response = Texts.to.empty;
    for (var r in result) {
      var newResponse = '${r.permission}: ${r.status?.getName}';
      response = '$response\n$newResponse';
    }
    await _dialog(response);
  }

  ///AppData
  saveAppData() async {}

  loadAppData() async {}

  importAppData() async {}

  exportAppData() async {}
}
