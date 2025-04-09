import 'flavor_type_enum.dart';

/**
 * Created by Abdullah on 9/4/25.
 */

class FlavorConfig{

  bool _lock = false;

  late final FlavorType flavor;
  late final String name;
  late final String url;

  static final FlavorConfig instance = FlavorConfig._internal();

  FlavorConfig._internal();

  factory FlavorConfig.instantiate({
    required FlavorType flavor,
    required String name,
    required String url,
  }) {
    if (instance._lock) return instance;
    instance._lock = true;
    instance.flavor = flavor;
    instance.name = name;
    instance.url = url;
    return instance;
  }

  static bool isProd() => instance.flavor == FlavorType.PROD;

  static bool isDev() => instance.flavor == FlavorType.DEV;

  static bool isUAT() => instance.flavor == FlavorType.UAT;
}