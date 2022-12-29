import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_market/home_screen.dart';
import 'package:grocery_market/screen/meat/meat_page.dart';
import 'package:grocery_market/screen/product_detail.dart';

import 'intro_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=>IntroScreen()),
      ],
    );
  }
}
