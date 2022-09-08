import 'package:ecommerce_pesacoder/helper/google_sign_in_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

  void googleSignInMethod() async {
    await GoogleSIgnInHelper.googleSignInMethod(_googleSignIn, _auth);
  }
}
