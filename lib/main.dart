import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:parallaxlogic/app/utils/app_theme.dart';
import 'package:parallaxlogic/app/utils/constants.dart';

import 'app/routes/app_pages.dart';

void main() async {
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
        theme: AppThemeData.themeData,
      ),
    ),
  );
}
