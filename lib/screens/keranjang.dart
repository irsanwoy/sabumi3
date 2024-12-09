import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabumi3/providers/cart_provider.dart';
import 'package:sabumi3/widgets/navbar.dart'; 

class Keranjang extends StatelessWidget {
  const Keranjang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2C2C2C), // Warna gelap pertama (lebih gelap dari sebelumnya)
              Color(0xFF505050), // Warna gelap kedua (lebih terang sedikit)
            ],
            begin: Alignment.topCenter,  // Mulai dari atas layar
            end: Alignment.bottomCenter,  // Berakhir di bawah layar
          ),
        ),
        child: Consumer<CartProvider>(
          builder: (context, cartProvider, child) {
            if (cartProvider.cartItems.isEmpty) {
              return const Center(
                child: Text("Keranjang Anda Kosong", style: TextStyle(color: Colors.white, fontSize: 18)),
              );
            }
            return ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartProvider.cartItems[index];
                return ListTile(
                  leading: Image.asset(item['imagePath']),
                  title: Text(item['name'], style: const TextStyle(color: Colors.white)),
                  subtitle: Text('Rp ${item['price']} x ${item['quantity']}', style: const TextStyle(color: Colors.white)),
                  trailing: Text(
                    'Rp ${(double.parse(item['price']) * item['quantity']).toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFFF77437),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total: ${_calculateTotal(context)}",
                style: const TextStyle(fontSize: 18, color: Colors.white),
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
