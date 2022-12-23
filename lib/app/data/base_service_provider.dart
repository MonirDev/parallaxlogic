import 'package:get/get.dart';
import 'package:parallaxlogic/app/utils/constants.dart';

class BaseServiceProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.baseUrl;
    httpClient.timeout = const Duration(seconds: 60);

    httpClient.addRequestModifier<void>((request) {
      request.headers[Constants.contentType] = Constants.applicationJson;

      return request;
    });
  }
}
