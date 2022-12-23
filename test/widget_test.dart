// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:parallaxlogic/app/data/models/product_model.dart';
import 'package:parallaxlogic/app/data/services/product_service.dart';

void main() {
  test('Get Product test', (() async {
    final controller = Get.put(ProductService());
    List<ProductModel>? productList = [];
    productList = await controller.getProducts();

    expect(productList, isNotNull);
  }));
}
