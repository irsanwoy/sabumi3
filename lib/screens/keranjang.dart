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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2C2C2C),
              Color(0xFF505050),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Consumer<CartProvider>(
          builder: (context, cartProvider, child) {
            if (cartProvider.cartItems.isEmpty) {
              return const Center(
                child: Text(
                  "Keranjang Anda Kosong",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartProvider.cartItems[index];
                return _buildCartItem(context, cartProvider, item, index);
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.zero, // Hilangkan padding default
                  minimumSize: const Size(150, 50), // Ukuran minimum tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded tombol
                  ),
                ),
                onPressed: () {
                  _showCheckoutDialog(context);
                },
                child: const SizedBox(
                  height: 50, // Tinggi tombol
                  child: Center(
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, CartProvider cartProvider,
      Map<String, dynamic> item, int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: const Color(0xFF3A3A3A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item['imagePath'],
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Rp ${item['price']}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    cartProvider.updateQuantity(index, item['quantity'] - 1);
                  },
                  icon: const Icon(Icons.remove_circle, color: Colors.white),
                ),
                Text(
                  '${item['quantity']}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    cartProvider.updateQuantity(index, item['quantity'] + 1);
                  },
                  icon: const Icon(Icons.add_circle, color: Colors.white),
                ),
              ],
            ),
          ],
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
    return 'Rp ${total.toStringAsFixed(0)}';
  }

  void _showCheckoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF3A3A3A),
        title: const Text(
          "Pesanan Diproses",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: const Text(
          "Siapin Duitnya ya Adick adick :)",
          style: TextStyle(
            color: Colors.white70,
            fontFamily: 'Fredoka',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "CKK OT",
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
