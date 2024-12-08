import 'package:flutter/material.dart';
import 'package:sabumi3/widgets/navbar.dart'; // Periksa path ini
import 'package:sabumi3/widgets/BottomNavbar.dart';

class PemesananKuliner extends StatefulWidget {
  const PemesananKuliner({super.key});

  @override
  _PemesananKulinerState createState() => _PemesananKulinerState();
}

class _PemesananKulinerState extends State<PemesananKuliner> {
  // Menyimpan jumlah item yang dipesan
  int _itemCount1 = 0;
  int _itemCount2 = 0;
  int _itemCount3 = 0;
  int _itemCount4 = 0;

  // Fungsi untuk menambah jumlah item
  void _incrementItem(int itemIndex) {
    setState(() {
      if (itemIndex == 1) {
        _itemCount1++;
      } else if (itemIndex == 2) {
        _itemCount2++;
      } else if (itemIndex == 3) {
        _itemCount3++;
      } else if (itemIndex == 4) {
        _itemCount4++;
      }
    });
  }

  // Fungsi untuk mengurangi jumlah item
  void _decrementItem(int itemIndex) {
    setState(() {
      if (itemIndex == 1 && _itemCount1 > 0) {
        _itemCount1--;
      } else if (itemIndex == 2 && _itemCount2 > 0) {
        _itemCount2--;
      } else if (itemIndex == 3 && _itemCount3 > 0) {
        _itemCount3--;
      } else if (itemIndex == 4 && _itemCount4 > 0) {
        _itemCount4--;
      }
    });
  }

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
              mainAxisAlignment: MainAxisAlignment.start, // Untuk menempatkan konten di bagian atas
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Pemesanan Menu\nBumi Aki',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Gambar dan Deskripsi Makanan 1
                menuItem(
                  'assets/ayambakar.png', // Path gambar pertama
                  'Ayam Bakar', // Nama makanan pertama
                  'Rp 20.000', // Harga makanan pertama
                  _itemCount1,
                  1,
                ),
                // Gambar dan Deskripsi Makanan 2
                menuItem(
                  'assets/nasiliwet.png', // Path gambar kedua
                  'Nasi Liwet', // Nama makanan kedua
                  'Rp 15.000', // Harga makanan kedua
                  _itemCount2,
                  2,
                ),
                // Gambar dan Deskripsi Makanan 3
                menuItem(
                  'assets/surabi.png', // Path gambar ketiga
                  'Surabi', // Nama makanan ketiga
                  'Rp 25.000', // Harga makanan ketiga
                  _itemCount3,
                  3,
                ),
                // Gambar dan Deskripsi Makanan 4
                menuItem(
                  'assets/mojito.png', // Path gambar keempat
                  'Mojito', // Nama makanan keempat
                  'Rp 15.000', // Harga makanan keempat
                  _itemCount4,
                  4,
                ),
                // Tombol Order
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Tambahkan aksi untuk tombol Order
                      print("Order clicked");
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), 
                      backgroundColor: Colors.orange, // Warna tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Pesan Sekarang',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Bottomnavbar(), // Panggil Footer di sini
    );
  }

  Widget menuItem(String imagePath, String name, String price, int itemCount, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Gambar Menu
          Image.asset(
            imagePath,
            height: 120, // Ukuran gambar
            width: 120,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          // Deskripsi dan Tombol Increment/Decrement
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 5),
              Text(
                price,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove, color: Colors.white),
                    onPressed: () => _decrementItem(index),
                  ),
                  Text(
                    '$itemCount',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.white),
                    onPressed: () => _incrementItem(index),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
