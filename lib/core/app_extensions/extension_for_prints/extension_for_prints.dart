import '../../app_localization_texts.dart';
import '../../core_functions.dart';

extension ExtensionOnFunctionsDebugPrint on Future<bool> {
  withStatusPrint({bool? isLog, String? featureName, String? message, String? successfulMessage, String? failureMessage}) => then((value) {
        String successfulMsg = message ?? successfulMessage ?? '$featureName ${Texts.to.statusPrintSentenceSuccessful}';
        String failureMsg = message ?? failureMessage ?? '$featureName ${Texts.to.statusPrintSentenceFailure}';
        if (isLog == true) {
          value ? appLogPrint(successfulMsg) : appLogPrint(failureMsg);
        } else {
          value ? appDebugPrint(successfulMsg) : appDebugPrint(failureMsg);
        }
      });
}
