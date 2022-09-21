import 'package:ecommerce_pesacoder/helper/get_storage_cache_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  Future<void> signOut() async {
    GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    await CacheHelper.signOut();
  }
}
