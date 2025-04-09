
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_prac_1_eu/core/theme/color_palettes.dart';

/**
 * Created by Abdullah on 8/4/25.
 */


class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: ColorPalettes.colorPrimary.withOpacity(0.6),
              spreadRadius:1,
              blurRadius: 2,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
          color: Theme.of(context).cardTheme.color,
        ),
        child: const CircularProgressIndicator(
          color:  ColorPalettes.colorPrimary,
        ),
      ),
    );
  }
}