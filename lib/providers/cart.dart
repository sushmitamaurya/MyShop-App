import 'package:flutter/foundation.dart';

class CartItem {
  final String? id;
  final String? title;
  final int? quanity;
  final double? price;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.quanity,
      @required this.price});
}

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 00.0;
    _items.forEach((key, cartItem) {
      total += (cartItem.price! * cartItem.quanity!);
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quanity: existingCartItem.quanity! + 1,
              price: existingCartItem.price));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              quanity: 1,
              price: price));
    }
    notifyListeners();
  }
}
