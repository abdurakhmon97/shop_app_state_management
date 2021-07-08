import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/providers/cart.dart';
import 'package:untitled/providers/product.dart';
import 'package:untitled/providers/products.dart';
import 'package:untitled/screens/cart_screen.dart';
import 'package:untitled/widgets/app_drawer.dart';
import 'package:untitled/widgets/badge.dart';
import 'package:untitled/widgets/product_item.dart';
import 'package:untitled/widgets/products_grid.dart';
import 'package:provider/provider.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsList = Provider.of<Products>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (_) {
              return [
                PopupMenuItem(
                  child: Text('Only favourites'),
                  value: 0,
                ),
                PopupMenuItem(
                  child: Text('Show All'),
                  value: 1,
                ),
              ];
            },
            onSelected: (int selected) {
              if (selected == 0)
                productsList.showOnlyFavourite();
              else
                productsList.showAll();
            },
            icon: Icon(Icons.more_vert),
          ),
          SizedBox(
            width: 5,
          ),
          Consumer<Cart>(
            builder: (_, cartData, child) => Badge(
              value: cart.itemCount.toString(),
              child: child,
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
        title: Text('MyShop'),
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(),
    );
  }
}
