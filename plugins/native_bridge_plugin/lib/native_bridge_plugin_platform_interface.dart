import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'native_bridge_plugin_method_channel.dart';

abstract class NativeBridgePluginPlatform extends PlatformInterface {
  /// Constructs a NativeBridgePluginPlatform.
  NativeBridgePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static NativeBridgePluginPlatform _instance = MethodChannelNativeBridgePlugin();

  /// The default instance of [NativeBridgePluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelNativeBridgePlugin].
  static NativeBridgePluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NativeBridgePluginPlatform] when
  /// they register themselves.
  static set instance(NativeBridgePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion();
  Future<int?> getBatteryLevel();
}
