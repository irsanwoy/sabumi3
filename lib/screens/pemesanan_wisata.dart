import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabumi3/providers/cart_provider.dart';
import 'package:sabumi3/widgets/navbar.dart';
import 'package:sabumi3/widgets/BottomNavbar.dart';

class PemesananWisata extends StatelessWidget {
  const PemesananWisata({super.key});

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
            kamarCard(
              context,
              'assets/kamar_superior.png',
              'Kamar Deluxe',
              'Rp 1.500.000',
            ),
            kamarCard(
              context,
              'assets/tenda_keong.png',
              'Kamar Standard',
              'Rp 1.000.000',
            ),
            kamarCard(
              context,
              'assets/tenda_dome.png',
              'Kamar Suite',
              'Rp 2.000.000',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Bottomnavbar(),
    );
  }

  Widget kamarCard(BuildContext context, String imagePath, String roomName, String price) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Image.asset(imagePath, width: 70, height: 70),
        title: Text(
          roomName,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          price,
          style: TextStyle(fontSize: 20),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.add_shopping_cart,
            size: 35,
          ),
          onPressed: () {
            String cleanedPrice = price.replaceAll("Rp", "").replaceAll(".", "").trim();
            Provider.of<CartProvider>(context, listen: false).addToCart(
              roomName,
              imagePath,
              cleanedPrice,
              1,
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$roomName berhasil ditambahkan ke keranjang')),
            );
          },
        ),
      ),
    );
  }
}
