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
        // Memungkinkan scroll untuk body
        child: Container(
          // Menambahkan gambar sebagai latar belakang
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpg'), // Ganti dengan path gambar latar belakang Anda
              fit: BoxFit.cover, // Agar gambar menutupi seluruh area
            ),
          ),
          child: Center( // Menambahkan Center di sini
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Untuk memastikan konten berada di tengah secara vertikal
              children: [
                // Menampilkan teks di bagian atas
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Wisata\nSavillage', // Judul atau deskripsi lainnya dengan baris baru
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center, // Menambahkan teks agar berada di tengah
                  ),
                ),
                // Galeri Gambar 1 dengan sudut melengkung
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16), // Radius sudut untuk gambar
                    child: Image.asset(
                      'assets/savilage.jpeg', // Ganti dengan path gambar yang sesuai
                      fit: BoxFit.cover,
                      width: 450, // Gambar akan mengisi lebar layar
                      height: 200, // Atur tinggi gambar
                    ),
                  ),
                ),
                // Galeri Gambar 2 dengan sudut melengkung
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16), // Radius sudut untuk gambar
                    child: Image.asset(
                      'assets/kamar.jpg', // Ganti dengan path gambar yang sesuai
                      fit: BoxFit.cover,
                      width: 450,
                      height: 200,
                    ),
                  ),
                ),
                // Galeri Gambar 3 dengan sudut melengkung
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16), // Radius sudut untuk gambar
                    child: Image.asset(
                      'assets/tenda.png', // Ganti dengan path gambar yang sesuai
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
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF77437), // Ganti warna tombol sesuai kebutuhan
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                // Tambahkan lebih banyak gambar sesuai kebutuhan
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Bottomnavbar(), // Panggil Footer di sini
    );
  }
}
