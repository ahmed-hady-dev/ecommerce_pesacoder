import 'package:ecommerce_pesacoder/core/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  AuthViewModel viewModel = Get.put(AuthViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'viewModel.counter.toString()',
            ),
          ],
        ),
      ),
    );
  }
}
