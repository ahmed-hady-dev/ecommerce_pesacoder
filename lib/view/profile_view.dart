import 'package:ecommerce_pesacoder/core/view_model/profile_view_model.dart';
import 'package:ecommerce_pesacoder/view/auth/login_view.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/get_storage_cache_helper.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) {
        return Column(
          children: [
            CustomButton(
                onPress: () {
                  controller.signOut();
                  print(' 1 ' + CacheHelper.getUserInfo.toString());
                  Get.offAll(LoginView());
                  print(' 2 ' + CacheHelper.getUserInfo.toString());
                },
                text: 'Sign out'),
            CustomButton(
                onPress: () async {
                  final user = await CacheHelper.getUserInfo!.toString();
                  print(' 1 ');
                  print(user);
                },
                text: 'print'),
          ],
        );
      },
    );
  }
}
