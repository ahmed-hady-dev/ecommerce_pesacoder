import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/cart_view.dart';
import '../../view/home_view.dart';
import '../../view/profile_view.dart';

class HomeViewModel extends GetxController {
  int _navigatorValue = 0;

  int get navigatorValue => _navigatorValue;
  List<Widget> viewsList = [
    HomeView(),
    CartView(),
    ProfileView(),
  ];

  void changeSelectedValue({required int selectedValue}) {
    _navigatorValue = selectedValue;
    update();
  }
}
