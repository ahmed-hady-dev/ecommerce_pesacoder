import 'package:ecommerce_pesacoder/constants.dart';
import 'package:ecommerce_pesacoder/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutViewModel extends GetxController {
  int _index = 0;
  int get index => _index;

  Pages _pages = Pages.DeliveryTime;
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
    _index = i;
    if (_index == 1) {
      _pages = Pages.AddAddress;
    } else if (_index == 2) {
      _pages = Pages.Summary;
    } else if (_index == 3) {
      Get.to(const ControlView());
      _index = 0;
    }
    update();
  }
}
