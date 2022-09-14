import 'package:ecommerce_pesacoder/core/view_model/auth_view_model.dart';
import 'package:ecommerce_pesacoder/view/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetWidget<AuthViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () async {
                  print(Get.find<AuthViewModel>().user);
                  await Get.find<AuthViewModel>().signOut();
                  print('---------------------------------------------' + Get.find<AuthViewModel>().user.toString());
                  Get.offAll(() => LoginView());
                },
                child: Text('sign out', style: const TextStyle())),
            Text(Get.find<AuthViewModel>().user.toString()),
          ],
        ),
      ),
    );
  }
}
