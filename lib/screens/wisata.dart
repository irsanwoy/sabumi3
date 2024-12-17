import 'package:flutter/material.dart';
import 'package:sabumi3/widgets/navbar.dart'; // Periksa path ini
import 'package:sabumi3/widgets/BottomNavbar.dart'; // Pastikan path ini benar
import 'package:sabumi3/screens/pemesanan_wisata.dart';

class Wisata extends StatelessWidget {
  const Wisata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(), // Menampilkan Navbar
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpg'), // Ganti dengan path gambar latar belakang Anda
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Menampilkan teks di bagian atas
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Wisata\nSavillage', // Judul atau deskripsi lainnya dengan baris baru
                    style: TextStyle(
                      fontSize: 28, // Ukuran font
                      fontWeight: FontWeight.bold,
                      fontFamily: 'LeckerliOne', // Menggunakan font Leckerli One
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Galeri Gambar 1
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/savilage.jpeg',
                      fit: BoxFit.cover,
                      width: 450,
                      height: 200,
                    ),
                  ),
                ),
                // Galeri Gambar 2
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/kamar.jpg',
                      fit: BoxFit.cover,
                      width: 450,
                      height: 200,
                    ),
                  ),
                ),
                // Galeri Gambar 3
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/tenda.png',
                      fit: BoxFit.cover,
                      width: 450,
                      height: 200,
                    ),
                  ),
                ),
                // Tombol Order
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PemesananWisata()));
                    },
                    child: Text(
                      'Order Disini',
                      style: TextStyle(
                        fontSize: 20, 
                        fontFamily: 'LeckerliOne',
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF77437),
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
      ),
      bottomNavigationBar: Bottomnavbar(),
    );
  }
}
