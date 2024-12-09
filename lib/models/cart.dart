// models/cart.dart
class CartItem {
  final String name;
  final String imagePath;
  final int price;
  int quantity;

  CartItem({required this.name, required this.imagePath, required this.price, this.quantity = 0});
}

class Cart {
  List<CartItem> items = [];

  void addItem(CartItem item) {
    final existingItem = items.firstWhere(
      (cartItem) => cartItem.name == item.name,
      orElse: () => CartItem(name: "", imagePath: "", price: 0),
    );

    if (existingItem.name.isNotEmpty) {
      existingItem.quantity += item.quantity;
    } else {
      items.add(item);
    }
  }

  void removeItem(CartItem item) {
    items.removeWhere((cartItem) => cartItem.name == item.name);
  }

  int get totalPrice => items.fold(0, (total, item) => total + (item.price * item.quantity));
}
