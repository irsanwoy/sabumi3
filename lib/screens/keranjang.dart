import 'package:flutter/material.dart';
import 'package:sabumi3/widgets/Navbar.dart';
import 'package:sabumi3/widgets/BottomNavbar.dart';

class Keranjang extends StatelessWidget {
  const Keranjang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(), // Navbar yang sudah dibuat sebelumnya

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'), // Ganti dengan path gambar latar belakang Anda
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul Halaman
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Keranjang Saya',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(10.0),
                children: [
                  // Tampilkan beberapa item keranjang
                  keranjangCard(
                    'timebomb_official',
                    'assets/item1.png',
                    'Timebomb Cardigan Knitwear',
                    'SIZE 2 (L-XL)',
                    187060,
                    2,
                  ),
                  keranjangCard(
                    'GRDT Official Shop',
                    'assets/item2.png',
                    'GRDT - Haunt Oversized Hoodie Black',
                    'SIZE L',
                    299000,
                    1,
                  ),
                  keranjangCard(
                    'KESTONE Nutrition',
                    'assets/item3.png',
                    'All in 1 Brain Functions Supplement',
                    '1 PCS',
                    120000,
                    3,
                  ),
                ],
              ),
            ),
            // Bagian bawah: Total dan tombol checkout
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}), // Pilih Semua
                  const Text('Semua', style: TextStyle(fontSize: 16)),
                  const Spacer(),
                  Text(
                    'Total: Rp0',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Aksi untuk checkout
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: Text(
                      'Checkout (0)',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Bottomnavbar(), // BottomNavbar yang sudah dibuat
    );
  }

  // Widget untuk menampilkan kartu keranjang
  Widget keranjangCard(
      String storeName, String imagePath, String itemName, String itemDetails, int price, int quantity) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Nama toko dan opsi ubah
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}), // Checkbox untuk item
                    Text(
                      storeName,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Aksi ubah item
                  },
                  child: Text(
                    'Ubah',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Konten: Gambar produk, detail, dan harga
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar Produk
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),

                // Detail Produk
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemName,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        itemDetails,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Rp${price.toString()}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ],
                  ),
                ),

                // Tombol tambah/kurang jumlah item
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.add_circle_outline),
                      onPressed: () {
                        // Aksi untuk menambah jumlah
                      },
                    ),
                    Text('$quantity', style: TextStyle(fontSize: 16)),
                    IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        // Aksi untuk mengurangi jumlah
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
