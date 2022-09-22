import 'package:ecommerce_pesacoder/constants.dart';
import 'package:ecommerce_pesacoder/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/enum.dart';

class CheckOutViewModel extends GetxController {
  String? street1, street2, city, state, country;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int _index = 0;
  int get index => _index;

  Pages _pages = Pages.deliveryTime;
  Pages get pages => _pages;

  final _processes = [
    'Delivery',
    'Address',
    'Summery',
  ];
  get processes => _processes;

  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (i < _index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }

  void changeIndex({required int i}) {
    if (i == 0 || i < 0) {
      _pages = Pages.deliveryTime;
      _index = i;
    } else if (i == 1) {
      _pages = Pages.addAddress;
      _index = i;
    } else if (i == 2) {
      formKey.currentState!.save();
      if (formKey.currentState!.validate()) {
        _pages = Pages.summary;
        _index = i;
      }
    } else if (i == 3) {
      _pages = Pages.deliveryTime;
      street1 = null;
      street2 = null;
      city = null;
      state = null;
      country = null;
      Get.off(() => const ControlView());
      i = 0;
      _index = i;
    }
    update();
  }
}
