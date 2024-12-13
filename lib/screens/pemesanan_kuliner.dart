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
  void _addToCart(String name, String imagePath, String price) {
    // Membersihkan string harga
    String cleanedPrice = price.replaceAll(RegExp(r'[^\d]'), ''); // Hanya menyisakan angka
    Provider.of<CartProvider>(context, listen: false).addToCart(
      name,
      imagePath,
      cleanedPrice,
      1,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$name berhasil ditambahkan ke keranjang')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2C2C2C), Color(0xFF505050)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Best Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  fontFamily: 'LeckerliOne',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildMenuCard(
                  context,
                  'assets/menu1.png',
                  'ES Campur',
                  'Rp 16,000',
                ),
                buildMenuCard(
                  context,
                  'assets/sop_iga.png',
                  'Sop Iga',
                  'Rp 67,000',
                ),
              ],
            ),
            
            Wrap(
              spacing: 15,
              runSpacing: 15,
              alignment: WrapAlignment.spaceBetween,
              children: [
                buildMenuCard(
                  context,
                  'assets/ayambakar.png',
                  'Ayam Bakar',
                  'Rp 45,000',
                ),
                buildMenuCard(
                  context,
                  'assets/nasiliwet.png',
                  'Nasi Liwet',
                  'Rp 70,000',
                ),
                buildMenuCard(
                  context,
                  'assets/surabi.png',
                  'Surabi',
                  'Rp 15,000',
                ),
                buildMenuCard(
                  context,
                  'assets/gurame.png',
                  'Gurame Goreng',
                  'Rp 55,000',
                ),
                buildMenuCard(
                  context,
                  'assets/mojito.png',
                  'Mojito',
                  'Rp 10,000',
                ),
                buildMenuCard(
                  context,
                  'assets/lemon_tea.png',
                  'Lemon Tea',
                  'Rp 10,000',
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Bottomnavbar(),
    );
  }

  Widget buildMenuCard(BuildContext context, String imagePath, String name, String price) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4, 
      decoration: BoxDecoration(
        color: Color(0xFF3A3A3A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    _addToCart(name, imagePath, price);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
