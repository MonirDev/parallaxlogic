import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parallaxlogic/app/utils/colors.dart';
import 'package:parallaxlogic/app/utils/constants.dart';

//show failed dialog
showErrorDialog(String text, {bool? callApi, Function? callbackFn}) {
  return Get.dialog(
    AlertDialog(
      title: const Text(Constants.failed),
      content: Text(text),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: AppColors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Text(
            Constants.tryAgain,
            style: Get.textTheme.bodyText1!.copyWith(color: AppColors.white),
          ),
          onPressed: () {
            if (callApi != null) callbackFn!();
            Get.back();
          },
        )
      ],
    ),
    barrierDismissible: false,
  );
}
