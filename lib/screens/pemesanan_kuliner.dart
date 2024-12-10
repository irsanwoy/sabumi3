import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabumi3/providers/cart_provider.dart';
import 'package:sabumi3/widgets/navbar.dart';
import 'package:sabumi3/widgets/BottomNavbar.dart';

class PemesananKuliner extends StatefulWidget {
  const PemesananKuliner({super.key});

  @override
  _PemesananKulinerState createState() => _PemesananKulinerState();
}

class _PemesananKulinerState extends State<PemesananKuliner> {
  int _itemCount1 = 0;
  int _itemCount2 = 0;
  int _itemCount3 = 0;

  void _incrementItem(int itemIndex) {
    setState(() {
      if (itemIndex == 1) _itemCount1++;
      if (itemIndex == 2) _itemCount2++;
      if (itemIndex == 3) _itemCount3++;
    });
  }

  void _decrementItem(int itemIndex) {
    setState(() {
      if (itemIndex == 1 && _itemCount1 > 0) _itemCount1--;
      if (itemIndex == 2 && _itemCount2 > 0) _itemCount2--;
      if (itemIndex == 3 && _itemCount3 > 0) _itemCount3--;
    });
  }

  void _addToCart(String name, String imagePath, String price, int quantity) {
    if (quantity > 0) {
      Provider.of<CartProvider>(context, listen: false).addToCart(
        name,
        imagePath,
        price.replaceAll(",", ""),
        quantity,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$name berhasil ditambahkan ke keranjang')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2C2C2C),
              Color(0xFF505050),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: [
            ListTile(
              leading: Image.asset('assets/ayambakar.png'),
              title: const Text(
                'Ayam Bakar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              subtitle: const Text(
                'Rp 20,000',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => _decrementItem(1),
                  ),
                  Text(
                    '$_itemCount1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => _incrementItem(1),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      _addToCart('Ayam Bakar', 'assets/ayambakar.png', '20,000', _itemCount1);
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Image.asset('assets/nasiliwet.png'),
              title: const Text(
                'Nasi Liwet',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              subtitle: const Text(
                'Rp 25,000',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => _decrementItem(2),
                  ),
                  Text(
                    '$_itemCount2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => _incrementItem(2),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      _addToCart('Nasi Liwet', 'assets/nasiliwet.png', '25,000', _itemCount2);
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Image.asset('assets/mojito.png'),
              title: const Text(
                'Mojito',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              subtitle: const Text(
                'Rp 10,000',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => _decrementItem(3),
                  ),
                  Text(
                    '$_itemCount3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => _incrementItem(3),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      _addToCart('Mojito', 'assets/mojito.png', '10,000', _itemCount3);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Bottomnavbar(),
    );
  }
}
