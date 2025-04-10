import 'package:package_info_plus/package_info_plus.dart';

class Helper {
  Helper._();

  /// Get the app version
  static Future<String> getAppName() async {
    var packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.appName;
  }

  /// Get the app version
  static Future<String> getAppVersion() async {
    var packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  /// Get the app build number
  static Future<String> getAppBuildNumber() async {
    var packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }
}
