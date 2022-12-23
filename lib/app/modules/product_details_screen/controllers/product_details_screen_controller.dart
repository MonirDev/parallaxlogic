import 'package:get/get.dart';
import 'package:parallaxlogic/app/data/common/show_error_dialog.dart';
import 'package:parallaxlogic/app/data/models/product_model.dart';
import 'package:parallaxlogic/app/data/services/product_service.dart';
import 'package:parallaxlogic/app/utils/constants.dart';

class ProductDetailsScreenController extends GetxController with StateMixin {
  var product = ProductModel().obs;
  var productId = Get.arguments as int;
  @override
  void onInit() {
    // call products Api
    callProductApi();
    super.onInit();
  }

  //
//Put Products Service
  final productsService = Get.put(ProductService());

//Call Product Api
  Future<void> callProductApi() async {
    await productsService.getProduct(productId).then((result) {
      if (result != null) {
        product.value = result;
        print(product.value.category);
        change(result, status: RxStatus.success());
      } else {
        showErrorDialog(Constants.somethingWentWrong,
            callApi: true, callbackFn: callProductApi);
        change(null, status: RxStatus.error(result.toString()));
      }
    }, onError: (err) {
      showErrorDialog(Constants.somethingWentWrong,
          callApi: true, callbackFn: callProductApi);
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
