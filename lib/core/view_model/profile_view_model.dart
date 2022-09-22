import 'package:ecommerce_pesacoder/helper/get_storage_cache_helper.dart';
import 'package:ecommerce_pesacoder/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    _loading.value = true;
    _userModel = CacheHelper.getUserInfo;
    _loading.value = false;
    update();
  }

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    await CacheHelper.signOut();
  }
}
