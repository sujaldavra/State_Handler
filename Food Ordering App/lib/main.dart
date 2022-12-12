import 'package:flutter/material.dart';
import 'package:food_ordering_app/controllers/products_list_controller.dart';
import 'package:food_ordering_app/views/screens/cart_screen.dart';
import 'package:food_ordering_app/views/screens/chat_screen.dart';
import 'package:food_ordering_app/views/screens/detail_screen.dart';
import 'package:food_ordering_app/views/screens/favorite_screen.dart';
import 'package:food_ordering_app/views/screens/bottom_navigationbar.dart';
import 'package:food_ordering_app/views/screens/home_screen.dart';
import 'package:food_ordering_app/views/screens/notification_screen.dart';
import 'package:food_ordering_app/views/screens/splash_screen.dart';
import 'package:get/get.dart';

import 'controllers/db_helper.dart';

void main() async {
  final ProductListController productListController =
      Get.put(ProductListController());

  await ProductDBHelper.productDBHelper.insertData();

  productListController.setProductList();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash_screen",
      getPages: [
        GetPage(name: "/", page: () => const BottomNavigationbar()),
        GetPage(name: "/splash_screen", page: () => const SplashScreen()),
        GetPage(name: "/home_screen", page: () => const HomeScreen()),
        GetPage(name: "/cart_screen", page: () => const CartScreen()),
        GetPage(name: "/favourite_screen", page: () => const FavoriteScreen()),
        GetPage(name: "/details_screen", page: () => const DetailScreen()),
        GetPage(name: "/chat_screen", page: () => const ChatScreen()),
        GetPage(name: "/notification_screen", page: () => const NotificationScreen()),
      ],
    ),
  );
}
