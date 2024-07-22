import '../../core/app_extensions/data_models_extensions/extension_app_version.dart';
import '../../features/versions/models/app_version/app_version.dart';

class AppInfo {
  static String get appName => 'Base Flutter MVC GetX App';
  static String get appNameInitials => 'BFMGA';
  static String get website => '';

  static AppVersion get appCurrentVersion => const AppVersion(version: '0.0.1');
  static AppVersionsList get versions => AppVersionsList().loadFromStorage;
  static int get appVersionsCounter => versions.versionsList.length;

  static String get baseUrl => 'resam-t.ir';
  static String get subDomain => 'basefluttermvcgetxapp';

  //FileNames
  static String get fileNameAPK => '${AppInfo.appNameInitials}_android.apk';
  static String get fileNameIPA => '${AppInfo.appNameInitials}_ios.ipa';
  static String get fileNameBackup => '${AppInfo.appNameInitials}_Backup.json';

  ///Core Flags
  static bool get isRelease => true;
  static bool get checkUpdate => false;
}
