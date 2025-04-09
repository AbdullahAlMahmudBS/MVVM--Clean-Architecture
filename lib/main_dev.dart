import 'package:flutter/material.dart';
import 'package:flutter_mvvm_prac_1_eu/core/config/flavor/flavor_config.dart';
import 'package:flutter_mvvm_prac_1_eu/core/config/flavor/flavor_type_enum.dart';
import 'package:flutter_mvvm_prac_1_eu/core/di/di_setup.dart';
import 'app.dart';
/**
 * Created by Abdullah on 9/4/25.
 */

void main() {

  FlavorConfig.instantiate(
      flavor: FlavorType.DEV,
      name: "Shop Ease Dev",
      url: "https://fakestoreapi.com"
  );

  setupDependencies();
  runApp(const MyApp());
}
