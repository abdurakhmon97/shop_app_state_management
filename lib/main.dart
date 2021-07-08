import 'package:flutter/material.dart';
import 'package:untitled/providers/cart.dart';
import 'package:untitled/providers/orders.dart';
import 'package:untitled/screens/cart_screen.dart';
import 'package:untitled/screens/orders_screen.dart';
import 'package:untitled/screens/product_detail_screen.dart';
import 'package:untitled/screens/products_overview_screen.dart';
import 'package:untitled/providers/products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Provider<String>(builder: (ctx) => 'Hi, I am a text!', child: ...); this is when it is not object, but primitive type
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Orders()),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
        },
      ),
    );
  }
}

