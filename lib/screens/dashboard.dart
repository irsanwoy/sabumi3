// file: lib/screens/dashboard.dart
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
        child: Image.asset(
          'assets/bgds.jpg', // Gambar background
          fit: BoxFit.fill, // Pastikan gambar mengisi layar sepenuhnya tanpa terpotong
          width: MediaQuery.of(context).size.width, // Lebar mengikuti lebar layar
          height: MediaQuery.of(context).size.height, // Tinggi mengikuti tinggi layar
        ),
      ),
      bottomNavigationBar: Bottomnavbar(), // Panggil Footer di sini
    );
  }
}
