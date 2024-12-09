import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabumi3/providers/cart_provider.dart';
import 'package:sabumi3/widgets/navbar.dart'; // Pastikan path ini benar
import 'package:sabumi3/widgets/BottomNavbar.dart'; // Pastikan path ini benar

class PemesananKuliner extends StatefulWidget {
  const PemesananKuliner({super.key});

  @override
  _PemesananKulinerState createState() => _PemesananKulinerState();
}

class _PemesananKulinerState extends State<PemesananKuliner> {
  int _itemCount1 = 0;
  int _itemCount2 = 0;

  void _incrementItem(int itemIndex) {
    setState(() {
      if (itemIndex == 1) _itemCount1++;
      if (itemIndex == 2) _itemCount2++;
    });
  }

  void _decrementItem(int itemIndex) {
    setState(() {
      if (itemIndex == 1 && _itemCount1 > 0) _itemCount1--;
      if (itemIndex == 2 && _itemCount2 > 0) _itemCount2--;
    });
  }

  void _addToCart(String name, String imagePath, String price, int quantity) {
    if (quantity > 0) {
      Provider.of<CartProvider>(context, listen: false).addToCart(
        name,
        imagePath,
        price.replaceAll(",", ""), // Hapus koma sebelum menambah ke keranjang
        quantity,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body: ListView(
        children: [
          ListTile(
            leading: Image.asset('assets/ayambakar.png'),
            title: const Text('Ayam Bakar'),
            subtitle: const Text('Rp 20,000'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => _decrementItem(1),
                ),
                Text('$_itemCount1'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => _incrementItem(1),
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    _addToCart('Ayam Bakar', 'assets/ayambakar.png', '20,000',
                        _itemCount1);
                  },
                ),
              ],
            ),
          ),
          ListTile(
            leading: Image.asset('assets/nasiliwet.png'),
            title: const Text('Nasi Liwet'),
            subtitle: const Text('Rp 25,000'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => _decrementItem(2),
                ),
                Text('$_itemCount2'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => _incrementItem(2),
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    _addToCart('Nasi Liwet', 'assets/nasiliwet.png', '25,000',
                        _itemCount2);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Bottomnavbar(),
    );
  }
}
