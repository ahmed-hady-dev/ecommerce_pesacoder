import 'package:ecommerce_pesacoder/view/widgets/home_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/view_model/auth_view_model.dart';
import '../core/view_model/control_view_model.dart';
import 'auth/login_view.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if ((Get.find<AuthViewModel>().user == null)) {
        return LoginView();
      } else {
        return GetBuilder<ControlViewModel>(
            init: ControlViewModel(),
            builder: (controller) {
              return Scaffold(
                bottomNavigationBar: const HomeBottomNavigationBar(),
                body: controller.currentScreen,
              );
            });
      }
    });
  }
}
