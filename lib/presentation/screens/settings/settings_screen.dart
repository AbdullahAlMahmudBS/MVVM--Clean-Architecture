import 'package:flutter/material.dart';
import 'package:flutter_mvvm_prac_1_eu/core/utils/language_helper.dart';
import 'package:flutter_mvvm_prac_1_eu/core/widgets/language_swircher.dart';
import 'package:native_bridge_plugin/native_bridge_plugin.dart';

/**
 * Created by Abdullah on 10/4/25.
 */

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final nativeBridger = NativeBridgePlugin();
  final ValueNotifier<String> _platformVersion = ValueNotifier("");
  final ValueNotifier<String> _batteryLevel = ValueNotifier("");

  @override
  void initState() {
    super.initState();
    _loadDeviceSpec();
  }

  void _loadDeviceSpec() async {
    final version = await nativeBridger.getPlatformVersion() ?? "Unknown";
    _platformVersion.value = version;

    final batteryLevel = await nativeBridger.getBatteryLevel() ?? "Unknown";
    _batteryLevel.value = batteryLevel.toString();
  }

  @override
  void dispose() {
    _platformVersion.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Localized.settings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                headerItem(Localized.settings),
                const Spacer(),
                const LanguageSwitcher(),
              ],
            ),
            const SizedBox(height: 8),
            headerItem(Localized.deviceInfo),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Localized.platformVersion),
                ValueListenableBuilder<String>(
                  valueListenable: _platformVersion,
                  builder: (context, version, _) => Text(version),
                ),
              ],
            ),

            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Localized.batteryLevel),
                ValueListenableBuilder<String>(
                  valueListenable: _batteryLevel,
                  builder: (context, level, _) => Text(level),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget headerItem(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 16,
        ),
      ),
    );
  }
}
