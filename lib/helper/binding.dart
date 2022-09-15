import 'package:ecommerce_pesacoder/core/view_model/auth_view_model.dart';
import 'package:ecommerce_pesacoder/core/view_model/home_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthViewModel(),
    );
    Get.lazyPut(
      () => HomeViewModel(),
    );
  }
}
