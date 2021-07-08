import 'package:flutter/material.dart';
import 'package:untitled/providers/orders.dart';
import 'package:untitled/widgets/app_drawer.dart';
import 'package:untitled/widgets/order_item.dart' as ord;
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders-screen';

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return ord.OrderItem(ordersData.orders[index]);
        },
        itemCount: ordersData.orders.length,
      ),
    );
  }
}
