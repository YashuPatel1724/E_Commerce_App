import 'package:e_commerce_app/HomeScreen/home_screen.dart';
import 'package:e_commerce_app/checkoutscreen/checkoutScreen.dart';
import 'package:e_commerce_app/splacescreen/splacescreen.dart';
import 'package:flutter/material.dart';

import 'CartScreen/cartscreen.dart';
import 'DetailScreen/detailscreen.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => SplaceScreen(),
        '/home' : (context) => HomeScreen(),
        '/detail' : (context) => DetailScreen(),
        '/cart' : (context) => CartScreen(),
        '/check' : (context) => CheckOutScreen(),
      },
    );
  }
}
