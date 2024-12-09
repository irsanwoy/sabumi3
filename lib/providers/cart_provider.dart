import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  // Menyimpan data keranjang
  void _saveCartToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('cart', json.encode(_cartItems));
  }

  // Memuat data keranjang
  Future<void> loadCartFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? cartData = prefs.getString('cart');
    if (cartData != null) {
      _cartItems = List<Map<String, dynamic>>.from(json.decode(cartData));
      notifyListeners();
    }
  }

  // Menambah item ke keranjang
  void addToCart(String name, String imagePath, String price, int quantity) async {
    final existingItemIndex = _cartItems.indexWhere((item) => item['name'] == name);

    if (existingItemIndex >= 0) {
      // Jika item sudah ada, tambahkan quantity
      _cartItems[existingItemIndex]['quantity'] += quantity;
    } else {
      // Jika item baru, tambahkan ke keranjang
      _cartItems.add({
        'name': name,
        'imagePath': imagePath,
        'price': price,
        'quantity': quantity,
      });
    }

    _saveCartToPrefs();
    notifyListeners();
  }

  // Menghapus semua item dari keranjang
  void clearCart() async {
    _cartItems.clear();
    _saveCartToPrefs();
    notifyListeners();
  }
}
