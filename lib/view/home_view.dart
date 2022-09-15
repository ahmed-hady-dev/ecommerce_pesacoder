import 'package:ecommerce_pesacoder/core/view_model/auth_view_model.dart';
import 'package:ecommerce_pesacoder/view/widgets/category_list_view.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_text.dart';
import 'package:ecommerce_pesacoder/view/widgets/home_bottom_navigation_bar.dart';
import 'package:ecommerce_pesacoder/view/widgets/products_list_view.dart';
import 'package:ecommerce_pesacoder/view/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetWidget<AuthViewModel> {
  HomeView({Key? key}) : super(key: key);
  final List<String> names = [
    's',
    's',
    's',
    's',
    's',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: HomeBottomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0, right: 16.0, left: 16.0),
        child: Column(
          children: [
            SearchTextField(),
            const SizedBox(height: 30.0),
            CustomText(text: 'Categories'),
            const SizedBox(height: 30.0),
            CategoryListView(names: names),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomText(
                  text: 'Best Selling',
                  fontSize: 18.0,
                ),
                TextButton(
                  onPressed: () {},
                  child: CustomText(
                    text: 'See all',
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            ProductsListView(names: names),
          ],
        ),
      ),
    );
  }
}
