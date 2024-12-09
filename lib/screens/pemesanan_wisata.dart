import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabumi3/providers/cart_provider.dart';
import 'package:sabumi3/widgets/navbar.dart'; // Pastikan path ini benar
import 'package:sabumi3/widgets/BottomNavbar.dart'; // Pastikan path ini benar


class PemesananWisata extends StatelessWidget {
  const PemesananWisata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),

      body: ListView(
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
      bottomNavigationBar: Bottomnavbar(),
    );
  }

  Widget kamarCard(BuildContext context, String imagePath, String roomName, String price) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50),
        title: Text(roomName),
        subtitle: Text(price),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed: () {
            // Bersihkan harga sebelum menambahkannya ke keranjang
            String cleanedPrice = price.replaceAll("Rp", "").replaceAll(".", "").trim();

            // Tambahkan item ke keranjang
            Provider.of<CartProvider>(context, listen: false).addToCart(
              roomName,
              imagePath,
              cleanedPrice, // Harga sudah bersih
              1, // Jumlah item
            );

            // Tampilkan Snackbar sebagai konfirmasi
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$roomName berhasil ditambahkan ke keranjang')),
            );
          },
        ),
      ),
    );
  }
}
