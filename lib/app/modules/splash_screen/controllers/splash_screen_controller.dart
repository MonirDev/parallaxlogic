import 'package:get/get.dart';
import 'package:parallaxlogic/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(Routes.home);
    });
    super.onInit();
  }
}
