import 'package:flutter/material.dart';
import 'package:flutter_mvvm_prac_1_eu/core/di/di_setup.dart';
import 'app.dart';
import 'core/config/flavor/flavor_config.dart';
import 'core/config/flavor/flavor_type_enum.dart';

void main() {

  FlavorConfig.instantiate(
      flavor: FlavorType.PROD,
      name: "Shop Ease",
      url: "https://fakestoreapi.com"
  );

  setupDependencies();
  runApp(const MyApp());
}
