// system_info.dart

import 'package:flutter/services.dart';

class SystemInfo {
  static const MethodChannel _channel = MethodChannel('system_info');

  static Future<String> getOSVersion() async {
    final String osVersion = await _channel.invokeMethod('getOSVersion');
    return osVersion;
  }
}
