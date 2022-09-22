import 'package:ecommerce_pesacoder/core/service/database/cart_database_helper.dart';
import 'package:ecommerce_pesacoder/model/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  List<CartProductModel> _cartProductModelList = [];
  List<CartProductModel> get cartProductModelList => _cartProductModelList;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  var dbHelper = CartDatabaseHelper.db;
  CartViewModel() {
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;
    var dbHelper = CartDatabaseHelper.db;
    _cartProductModelList = await dbHelper.getAllProduct();
    print('_cartProductModelList.length is =  ${_cartProductModelList.length}');
    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModelList.length; i++) {
      _totalPrice += double.parse(_cartProductModelList[i].price!) * _cartProductModelList[i].quantity!;
      print('_totalPrice = $_totalPrice');
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModelList.length; i++) {
      if (_cartProductModelList[i].productId == cartProductModel.productId) {
        return;
      }
    }
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.insert(cartProductModel);
    _cartProductModelList.add(cartProductModel);
    _totalPrice += double.parse(cartProductModel.price!) * cartProductModel.quantity!;
    print('added successfully =  ${cartProductModel.toString()}');
    update();
  }

  increaseQuantity(int index) async {
    _cartProductModelList[index].quantity = _cartProductModelList[index].quantity! + 1;
    _totalPrice += double.parse(_cartProductModelList[index].price!);
    dbHelper.updateProduct(_cartProductModelList[index]);
    update();
  }

  decreaseQuantity(int index) {
    _cartProductModelList[index].quantity = _cartProductModelList[index].quantity! - 1;
    _totalPrice -= double.parse(_cartProductModelList[index].price!);
    dbHelper.updateProduct(_cartProductModelList[index]);
    update();
  }

  deleteDatabase() async {
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.clearDatabase();
  }
}
