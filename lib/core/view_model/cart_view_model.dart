import 'package:ecommerce_pesacoder/core/service/database/cart_database_helper.dart';
import 'package:ecommerce_pesacoder/model/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  List<CartProductModel> _cartProductModelList = [];
  List<CartProductModel> get cartProductModelList => _cartProductModelList;

  CartViewModel() {
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;
    var dbHelper = CartDatabaseHelper.db;
    _cartProductModelList = await dbHelper.getAllProduct();
    print('_cartProductModelList.length is =  ' + _cartProductModelList.length.toString());
    _loading.value = false;
    update();
  }

  addProduct(CartProductModel cartProductModel) async {
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.insert(cartProductModel);
    print('added successfully =  ' + await cartProductModel.toString());
    update();
  }

  deleteDatabase() async {
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.clearDatabase();
  }
}
