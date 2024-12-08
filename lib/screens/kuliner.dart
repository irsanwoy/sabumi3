import 'package:flutter/material.dart';
import 'package:sabumi3/widgets/navbar.dart'; // Periksa path ini
import 'package:sabumi3/widgets/BottomNavbar.dart'; // Pastikan path ini benar
import 'package:sabumi3/screens/pemesanan_kuliner.dart';

class Kuliner extends StatelessWidget {
  const Kuliner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(), // Menampilkan Navbar
      body: Container(
        // Menambahkan gambar background dengan BoxDecoration
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/bg.jpg'), // Ganti dengan path gambar background Anda
            fit: BoxFit.cover, // Menyesuaikan gambar dengan ukuran layar
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Gambar utama (Bumi Aki)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/bumi_aki.png', // Ganti dengan path gambar utama Anda
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250, // Gambar utama yang lebih besar
                ),
              ),
              // Teks Review
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Review Kuliner Bumi Aki',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Nikmati kuliner terbaik yang ada di Bumi Aki, tempat yang sangat cocok untuk keluarga dan teman-teman.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              // Dua gambar menu yang bersebelahan
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Gambar menu 1
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/menu1.png'), // Ganti dengan path gambar menu 1
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    // Gambar menu 2
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/menu2.png'), // Ganti dengan path gambar menu 2
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Tombol Order
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi ketika tombol ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PemesananKuliner()),
                    );
                    // Anda bisa menambahkan navigasi atau aksi lain di sini
                  },
                  child: Text(
                    'Order Disini',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(
                        0xFFF77437), // Ganti warna tombol sesuai kebutuhan
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Bottomnavbar(), // Panggil Footer di sini
    );
  }
}
