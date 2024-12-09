import 'package:flutter/material.dart';
import 'package:sabumi3/widgets/Navbar.dart';
import 'package:sabumi3/widgets/BottomNavbar.dart';

class PemesananWisata extends StatelessWidget {
  const PemesananWisata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),  // Navbar yang sudah Anda buat

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'), // Ganti dengan path gambar latar belakang Anda
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul Halaman
              Text(
                'Savillage Ticket',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),

              // Daftar kamar (ListView untuk menampilkan beberapa pilihan)
              Expanded(
                child: ListView(
                  children: [
                    kamarCard(
                      context,
                      'assets/kamar_superior.png', // Gambar kamar
                      'Kamar Deluxe', // Nama kamar
                      'Kamar dengan fasilitas mewah dan pemandangan indah.', // Deskripsi kamar
                      'Rp 1.500.000', // Harga kamar
                    ),
                    kamarCard(
                      context,
                      'assets/tenda_keong.png', // Gambar kamar
                      'Kamar Standard', // Nama kamar
                      'Kamar nyaman dengan fasilitas standar yang lengkap.', // Deskripsi kamar
                      'Rp 1.000.000', // Harga kamar
                    ),
                    kamarCard(
                      context,
                      'assets/tenda_dome.png', // Gambar kamar
                      'Kamar Suite', // Nama kamar
                      'Kamar dengan ruang tamu pribadi dan jacuzzi.', // Deskripsi kamar
                      'Rp 2.000.000', // Harga kamar
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Bottomnavbar(), // Footer
    );
  }

  // Widget untuk card kamar
  Widget kamarCard(BuildContext context, String imagePath, String roomName, String description, String price) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            // Gambar Kamar
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 20),

            // Informasi Kamar (Nama, Deskripsi, Harga)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roomName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  // Deskripsi dan Ikon
                  _buildDescriptionWithIcon(Icons.fastfood, "Termasuk Makan Pagi Untuk 2 Orang", Colors.orange),
                  SizedBox(height: 5),
                  _buildDescriptionWithIcon(Icons.wifi, "Wi-Fi Gratis", Colors.blue),
                  SizedBox(height: 5),
                  _buildDescriptionWithIcon(Icons.smoking_rooms, "Boleh Merokok", Colors.green),
                  SizedBox(height: 10),

                  // Harga Kamar
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),

                  // Tombol Pesan
                  ElevatedButton(
                    onPressed: () {
                      // Aksi saat tombol Pesan ditekan
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Warna tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: Text(
                      'Pesan Kamar',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk menampilkan deskripsi dengan ikon
  Widget _buildDescriptionWithIcon(IconData icon, String text, Color iconColor) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 20,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
