import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(String name, String imagePath, String price, int quantity) {
    _cartItems.add({
      'name': name,
      'imagePath': imagePath,
      'price': price, // Harga disimpan sebagai String
      'quantity': quantity,
    });
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
