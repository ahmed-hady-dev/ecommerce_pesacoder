import 'package:ecommerce_pesacoder/core/view_model/home_view_model.dart';
import 'package:get/get.dart';

import '../core/view_model/auth_view_model.dart';
import '../core/view_model/control_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel(), fenix: true);
    Get.lazyPut(() => HomeViewModel(), fenix: true);
    // Get.lazyPut(() => CartViewModel(), fenix: true);
  }
}
