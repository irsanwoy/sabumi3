import 'package:flutter/material.dart';
import 'package:sabumi3/widgets/navbar.dart'; // Periksa path ini
import 'package:sabumi3/widgets/BottomNavbar.dart'; // Pastikan path ini benar



class Kuliner extends StatelessWidget {
  const Kuliner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(), // Menampilkan Navbar
      body: SingleChildScrollView(
        // Memungkinkan scroll untuk body
        child: Center( // Menambahkan Center di sini
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Untuk memastikan konten berada di tengah secara vertikal
            children: [
              // Menampilkan teks di bagian atas
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Kuliner\nBumi Aki', // Judul atau deskripsi lainnya dengan baris baru
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center, // Menambahkan teks agar berada di tengah
                ),
              ),
              // Galeri Gambar 1
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/gambar1.jpg', // Ganti dengan path gambar yang sesuai
                  fit: BoxFit.cover,
                  width: double.infinity, // Gambar akan mengisi lebar layar
                  height: 200, // Atur tinggi gambar
                ),
              ),
              // Galeri Gambar 2
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/gambar2.jpg', // Ganti dengan path gambar yang sesuai
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              // Galeri Gambar 3
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/gambar3.jpg', // Ganti dengan path gambar yang sesuai
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              // Tambahkan lebih banyak gambar sesuai kebutuhan
            ],
          ),
        ),
      ),
      bottomNavigationBar: Bottomnavbar(), // Panggil Footer di sini
    );
  }
}