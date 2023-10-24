// SystemInfoPlugin.swift

import Flutter
import UIKit

public class SystemInfoPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "system_info", binaryMessenger: registrar.messenger())
        let instance = SystemInfoPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "getOSVersion" {
            let osVersion = UIDevice.current.systemVersion
            result(osVersion)
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
}
