import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'constants/native_bridge_constant.dart';
import 'native_bridge_plugin_platform_interface.dart';

/// An implementation of [NativeBridgePluginPlatform] that uses method channels.
class MethodChannelNativeBridgePlugin extends NativeBridgePluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel(NativeBridgeConstant.METHOD_CHANNEL);

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(NativeBridgeConstant.METHOD_PLATFORM_VERSION);
    print("version: $version");
    return version;
  }

  @override
  Future<int?> getBatteryLevel() async{
    final level = await methodChannel.invokeMethod<int>(NativeBridgeConstant.METHOD_BATTERY_LEVEL);
    print("Level: $level");
    return level;
  }
}
