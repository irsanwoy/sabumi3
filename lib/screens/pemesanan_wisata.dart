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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          children: [
            buildRoomCard(
              context,
              'assets/kamar_superior.png',
              'Clamping Superior',
              'Kamar Superior Tempat Tidur King atau Single + Pemandangan Gunung',
              'Termasuk Makan Pagi untuk 3 Orang',
              'IDR 1,067,138',
              'Pesan',
            ),
            buildRoomCard(
              context,
              'assets/tenda_keong.png',
              'Tenda Keong',
              'Kamar Keluarga dengan Ranjang 2 Double Pemandangan Gunung',
              'Termasuk Makan Pagi untuk 4 Orang',
              'IDR 784,690',
              'Pesan',
            ),
            buildRoomCard(
              context,
              'assets/tenda_dome.png',
              'Tenda Dome',
              'Kamar dengan Ranjang Single atau Double Pemandangan Gunung',
              'Termasuk Makan Pagi untuk 4 Orang',
              'IDR 364,655',
              'Pesan',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Bottomnavbar(),
    );
  }

  Widget buildRoomCard(
    BuildContext context,
    String imagePath,
    String title,
    String description,
    String breakfastInfo,
    String price,
    String buttonText,
  ) {
    return Card(
      color: Color(0xFF3A3A3A),
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    breakfastInfo,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    price,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String cleanedPrice = price.replaceAll("IDR", "").replaceAll(",", "").trim();
                Provider.of<CartProvider>(context, listen: false).addToCart(
                  title,
                  imagePath,
                  cleanedPrice,
                  1,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$title berhasil ditambahkan ke keranjang')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
