import 'package:ecommerce_pesacoder/view/auth/login_view.dart';
import 'package:ecommerce_pesacoder/view/control_view.dart';
import 'package:ecommerce_pesacoder/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'helper/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
