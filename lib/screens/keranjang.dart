import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabumi3/providers/cart_provider.dart';


class Keranjang extends StatelessWidget {
  const Keranjang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Keranjang")),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          if (cartProvider.cartItems.isEmpty) {
            return const Center(
              child: Text("Keranjang Anda Kosong"),
            );
          }
          return ListView.builder(
            itemCount: cartProvider.cartItems.length,
            itemBuilder: (context, index) {
              final item = cartProvider.cartItems[index];
              return ListTile(
                leading: Image.asset(item['imagePath']),
                title: Text(item['name']),
                subtitle: Text('Rp ${item['price']} x ${item['quantity']}'),
                trailing: Text(
                  'Rp ${(double.parse(item['price']) * item['quantity']).toStringAsFixed(2)}',
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total: ${_calculateTotal(context)}",
                style: const TextStyle(fontSize: 18),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Checkout"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _calculateTotal(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    double total = 0;
    for (var item in cartProvider.cartItems) {
      total += double.parse(item['price']) * item['quantity'];
    }
    return 'Rp ${total.toStringAsFixed(2)}';
  }
}
