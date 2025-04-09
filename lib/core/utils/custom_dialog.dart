import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_prac_1_eu/core/routing/app_routes.dart';
import 'package:flutter_mvvm_prac_1_eu/core/services/navigator/app_navigation_service.dart';

/**
 * Created by Abdullah on 8/4/25.
 */

showCustomDialog(message,
    {title,
      String? positiveButtonText,
      String? negativeButtonText,
      bool isCancelAble=true,
      Function()? positiveButtonAction,
      Function()? negativeButtonAction,
      bool willPopOnPositiveAction=true,
      bool willPopOnNegativeAction=true,
      GlobalKey? key}) {
  showDialog(
    barrierDismissible: false,
    builder: (BuildContext context) {
      return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) {
            return;
          }
          return;
        },
        child: CupertinoAlertDialog(
          key: key,
          title: Text(
            title ?? "",
          ),
          content: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
             message
            ),
          ),
          actions: <Widget>[
            if (negativeButtonAction != null)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: () {
                  AppRoutes.pop();
                },
                child: Text(
                  "Cancel",
                ),
              ),
            if(isCancelAble)ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: Text(
                "Ok",
              ),
              onPressed: () {
                AppRoutes.pop();
                positiveButtonAction?.call();
              },
            ),
          ],
        ),
      );
    },
    context: AppNavigatorService.navigatorKey.currentContext!,
  );
}