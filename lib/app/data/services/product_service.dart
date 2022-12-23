import 'dart:developer';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:parallaxlogic/app/data/base_service_provider.dart';
import 'package:parallaxlogic/app/data/models/product_model.dart';
import 'package:parallaxlogic/app/utils/constants.dart';

class ProductService extends BaseServiceProvider {
  //call products api
  Future<List<ProductModel>?> getProducts() async {
    final Response res;
    try {
      res = await get(
        Constants.products,
      );

      log('products api called........');
      // log('......${res.body}');
      return productModelFromJson(res.body);
    } catch (e) {
      return null;
    }
  }

  //call product api using ID
  Future<ProductModel?> getProduct(int id) async {
    final Response res;
    try {
      res = await get(
        "${Constants.products}/$id",
      );

      log('product api called........');
      return ProductModel.fromJson(res.body);
    } catch (e) {
      return null;
    }
  }
}
