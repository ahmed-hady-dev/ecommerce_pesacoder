import 'package:ecommerce_pesacoder/core/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) {
          return BottomNavigationBar(
            elevation: 0.0,
            selectedItemColor: Colors.black,
            backgroundColor: Colors.grey.shade50,
            currentIndex: controller.navigatorValue,
            onTap: (index) => controller.changeSelectedValue(selectedValue: index),
            items: [
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text('Explore'),
                ),
                label: '',
                icon: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Image.asset(
                    'assets/images/Icon_Explore.png',
                    fit: BoxFit.cover,
                    width: 20.0,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text('Cart'),
                ),
                label: '',
                icon: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Image.asset(
                    'assets/images/Icon_Cart.png',
                    fit: BoxFit.cover,
                    width: 20.0,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text('Account'),
                ),
                label: '',
                icon: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Image.asset(
                    'assets/images/Icon_User.png',
                    fit: BoxFit.cover,
                    width: 20.0,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
