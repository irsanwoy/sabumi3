import 'package:flutter/material.dart';
import 'package:sabumi3/widgets/navbar.dart'; // Pastikan path ini benar
import 'package:sabumi3/widgets/BottomNavbar.dart'; // Pastikan path ini benar

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(), // Navbar di bagian atas
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width, // Lebar mengikuti lebar layar
          height: MediaQuery.of(context).size.height, // Tinggi mengikuti tinggi layar
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
          child: Center( // Tempatkan logo di tengah
            child: Image.asset(
              'assets/bgds2.png', // Ganti dengan path ke logo Anda
              width: 500, // Tentukan lebar logo
              height: 500, // Tentukan tinggi logo
            ),
          ),
        ),
      ),
      bottomNavigationBar: Bottomnavbar(), // Panggil Footer di sini
    );
  }
}
