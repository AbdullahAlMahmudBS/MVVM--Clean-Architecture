import Flutter
import UIKit

public class NativeBridgePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "native_bridge_plugin", binaryMessenger: registrar.messenger())
    let instance = NativeBridgePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "getBatteryLevel":
      UIDevice.current.isBatteryMonitoringEnabled = true
      let batteryLevel = UIDevice.current.batteryLevel
      print("iOS Battery Level Raw: \(batteryLevel)") // Debug log
      if batteryLevel >= 0 {
        result(Int(batteryLevel * 100)) // Convert 0.0-1.0 to 0-100
      } else {
        result(FlutterError(code: "UNAVAILABLE", message: "\(batteryLevel)Battery level not available (*_*)", details: nil))
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
