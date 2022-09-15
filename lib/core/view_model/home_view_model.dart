import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  int _navigatorValue = 0;

  int get navigatorValue => _navigatorValue;

  void changeSelectedValue({required int selectedValue}) {
    _navigatorValue = selectedValue;
    update();
  }
}
