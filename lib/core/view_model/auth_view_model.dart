import 'package:ecommerce_pesacoder/helper/get_storage_cache_helper.dart';
import 'package:ecommerce_pesacoder/model/user_model.dart';
import 'package:ecommerce_pesacoder/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../service/firestore_user.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? email, password, name;

  final Rxn<User> _user = Rxn<User>();

  User? get user => _user.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    try {
      print(googleUser);
      GoogleSignInAuthentication googleSignInAuthentication = await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await _auth.signInWithCredential(credential).then((user) {
        saveUser(user);
        Get.offAll(ControlView());
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error login account',
        e.message.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void facebookSignInMethod() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(permissions: ['email', 'public_profile']);

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(accessToken.token);
        final UserCredential userCredential = await _auth.signInWithCredential(facebookAuthCredential);
        saveUser(userCredential);
        Get.offAll(ControlView());
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email!.trim(), password: password!.trim()).then((value) async {
        await FireStoreUser().getCurrentUser(uid: value.user!.uid).then(
              (value) => setUser(
                userModel: UserModel.fromJson(value.data() as Map<dynamic, dynamic>),
              ),
            );
      });
      Get.offAll(ControlView());
      email = null;
      name = null;
      password = null;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error login account',
        e.message.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email!.trim(), password: password!.trim()).then((user) async {
        saveUser(user);
      });
      email = null;
      name = null;
      password = null;
      Get.offAll(ControlView());
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      email: user.user!.email,
      name: name ?? user.user!.displayName,
      pic: user.user!.photoURL ?? '',
    );
    await FireStoreUser().addUserToFireStore(userModel);
    await setUser(userModel: userModel);
  }

  setUser({required UserModel userModel}) async {
    await CacheHelper.cacheUser(userModel: userModel);
  }
}
