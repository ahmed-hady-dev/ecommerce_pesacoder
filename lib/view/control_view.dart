import 'package:ecommerce_pesacoder/core/view_model/home_view_model.dart';
import 'package:ecommerce_pesacoder/view/widgets/home_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/view_model/auth_view_model.dart';
import 'auth/login_view.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if ((Get.find<AuthViewModel>().user == null)) {
        return LoginView();
      } else {
        return GetBuilder<HomeViewModel>(builder: (controller) {
          return Scaffold(
            bottomNavigationBar: HomeBottomNavigationBar(),
            body: controller.viewsList[controller.navigatorValue],
          );
        });
      }
    });
  }
}
