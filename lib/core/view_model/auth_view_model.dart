import 'package:ecommerce_pesacoder/helper/social_auth_helper.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  void googleSignInMethod() async {
    final user = await SocialAuthHelper.signInWithGoogle(context: Get.context!);
    print(user);
  }

  void facebookSignInMethod() {
    final user = SocialAuthHelper.signInWithFacebook(context: Get.context!);
    print(user);
  }

  void signOut() async {
    await SocialAuthHelper.signOut(context: Get.context!);
    print(SocialAuthHelper.auth.currentUser);
  }
}
