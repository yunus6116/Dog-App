import 'package:flutter/services.dart';

/// Helper class for getting system info
class SystemInfo {
  static const MethodChannel _channel = MethodChannel('system_info');

  /// Gets the OS version
  static Future<String> getOSVersion() async {
    final String osVersion = await _channel.invokeMethod('getOSVersion');
    return osVersion;
  }
}
