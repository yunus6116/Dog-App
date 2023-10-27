import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let systemInfoChannel = FlutterMethodChannel(name: "system_info",
                                                binaryMessenger: controller.binaryMessenger)
    systemInfoChannel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      guard call.method == "getOSVersion" else {
        result(FlutterMethodNotImplemented)
        return
      }
      self?.receiveOSVersion(result: result)
    })
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  private func receiveOSVersion(result: @escaping FlutterResult) {
    let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    result(appVersion + "- " + buildNumber)
  }
}
