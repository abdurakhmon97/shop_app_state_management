import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(this.id, this.title, this.quantity, this.price);
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    if(_items.containsKey(productId)) {
      _items.update(productId, (value) => CartItem(value.id, value.title, value.quantity + 1, value.price));
    }
    else {
      _items.putIfAbsent(productId, () => CartItem(DateTime.now().toString(), title, 1, price));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
