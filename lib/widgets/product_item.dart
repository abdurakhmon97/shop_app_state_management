import 'package:flutter/material.dart';
import 'package:untitled/providers/cart.dart';
import 'package:untitled/providers/product.dart';
import 'package:untitled/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          trailing: IconButton(
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
            },
          ),
          leading: Consumer<Product>(//this is to optimize the app, the builder does not rerun, but whatever
            builder: (ctx, product, child) => IconButton(//under this consumer will rebuild in case of a data change
              color: Theme.of(context).accentColor,
              icon: product.isFavourite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
              onPressed: product.toggleFavoriteStatus,
            ),
          ),
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
