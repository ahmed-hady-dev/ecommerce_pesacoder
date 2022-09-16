import 'package:ecommerce_pesacoder/core/service/home_services.dart';
import 'package:ecommerce_pesacoder/model/category_model.dart';
import 'package:ecommerce_pesacoder/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
  }
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  List<CategoryModel> _categoryModelList = [];
  List<CategoryModel> get categoryModelList => _categoryModelList;

  List<ProductModel> _productModelList = [];
  List<ProductModel> get productModelList => _productModelList;

  Future<void> getCategory() async {
    _loading.value = true;
    await HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModelList.add(CategoryModel.fromJson(value[i].data() as Map<String, dynamic>));
      }
      _loading.value = false;
    });
    update();
  }

  Future<void> getBestSellingProducts() async {
    _loading.value = true;
    await HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModelList.add(ProductModel.fromJson(value[i].data() as Map<String, dynamic>));
        print(_productModelList.length);
      }
      _loading.value = false;
    });
    update();
  }
}
