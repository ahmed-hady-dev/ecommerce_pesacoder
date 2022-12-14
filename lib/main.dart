import 'package:ecommerce_pesacoder/core/view_model/cart_view_model.dart';
import 'package:ecommerce_pesacoder/helper/get_storage_cache_helper.dart';
import 'package:ecommerce_pesacoder/view/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'helper/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  CacheHelper.init();
  Get.put(CartViewModel(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      title: 'ECommerce App',
      home: ControlView(),
      theme: ThemeData(
        fontFamily: 'SourceSans',
      ),
    );
  }
}
