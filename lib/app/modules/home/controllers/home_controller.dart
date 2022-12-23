import 'package:get/get.dart';
import 'package:parallaxlogic/app/data/common/show_error_dialog.dart';
import 'package:parallaxlogic/app/data/models/product_model.dart';
import 'package:parallaxlogic/app/data/services/product_service.dart';
import 'package:parallaxlogic/app/routes/app_pages.dart';
import 'package:parallaxlogic/app/utils/constants.dart';

class HomeController extends GetxController with StateMixin {
  var productList = <ProductModel>[].obs;
  var menClothingList = <ProductModel>[].obs;
  var womenClothingList = <ProductModel>[].obs;
  var jeweleryProductList = <ProductModel>[].obs;
  var electronicsProductList = <ProductModel>[].obs;

  @override
  void onInit() {
    // call products Api
    callProductsApi();
    super.onInit();
  }

  //
//Put Products Service
  final productsService = Get.put(ProductService());

//go to Details Page
  goToDetailspage(int id) {
    Get.toNamed(Routes.productDetailsScreen, arguments: id);
  }

//Call Products Api
  Future<void> callProductsApi() async {
    await productsService.getProducts().then((result) {
      if (result != null) {
        productList.value = result;
        menClothingList.value = productList
            .where((element) => element.category == Constants.menClothing)
            .toList();
        womenClothingList.value = productList
            .where((element) => element.category == Constants.womenClothing)
            .toList();
        jeweleryProductList.value = productList
            .where((element) => element.category == Constants.jewelery)
            .toList();
        electronicsProductList.value = productList
            .where((element) => element.category == Constants.electronics)
            .toList();
        change(result, status: RxStatus.success());
      } else {
        showErrorDialog(Constants.somethingWentWrong,
            callApi: true, callbackFn: callProductsApi);
        change(null, status: RxStatus.error(result.toString()));
      }
    }, onError: (err) {
      showErrorDialog(Constants.somethingWentWrong,
          callApi: true, callbackFn: callProductsApi);
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
