import 'package:intl/intl.dart' show DateFormat, NumberFormat;
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

  static String dateTimeFormatter({
    DateTime? dateTime,
    required String format,
    bool? onlyDate = false,
    bool? onlyTime = false,
  }) {
    if (dateTime == null) {
      return "";
    }

    try {
      if (onlyDate == true) {
        // Use the provided format if it's for date-only formatting
        // or default to a standard date format if none specified
        String dateFormat = format.isNotEmpty ? format : 'd MMMM yyyy';
        return DateFormat(dateFormat).format(dateTime);
      } else if (onlyTime == true) {
        // Use the provided format if it's for time-only formatting
        // or default to a standard time format if none specified
        String timeFormat = format.isNotEmpty ? format : 'HH:mm:ss';
        return DateFormat(timeFormat).format(dateTime);
      }

      return DateFormat(format).format(dateTime);
    } catch (e) {
      // Optionally handle invalid format errors
      return "";
    }
  }

  static String beautifyInt(int? value) {
    // Return "00" if value is null
    if (value == null) {
      return "00";
    }

    // Add leading zero for single digits (0-9)
    if (value >= 0 && value <= 9) {
      return "0$value";
    }

    // Format with thousands separator for values >= 1000
    if (value >= 1000) {
      return NumberFormat("#,###").format(value);
    }

    // Return as is for other values
    return value.toString();
  }
}
