import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:parallaxlogic/app/utils/colors.dart';
import 'package:parallaxlogic/app/utils/constants.dart';
import 'package:parallaxlogic/app/utils/spacer_widgets.dart';

loader() {
  return Get.dialog(
    AlertDialog(
      content: SizedBox(
        height: 50,
        child: Row(
          children: [
            const SpinKitCircle(
              color: AppColors.primaryColor,
              size: 25,
            ),
            SpacerWidget.w10,
            const Text(Constants.pleaseWait),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
