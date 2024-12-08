import 'package:flutter/material.dart';
import 'package:sabumi3/widgets/navbar.dart'; // Periksa path ini
import 'package:sabumi3/widgets/BottomNavbar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(), // Navbar di atas

      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpg'), // Ganti dengan path gambar latar belakang yang sesuai
              fit: BoxFit.cover, // Membuat gambar memenuhi seluruh latar belakang
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Gambar profil
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/profile.png'), // Ganti dengan gambar profil yang sesuai
                ),
                SizedBox(height: 20),
                
                // Nama pengguna
                Text(
                  'Nama Pengguna',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Ganti warna teks sesuai kebutuhan
                  ),
                ),
                SizedBox(height: 10),

                // Nomor HP
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.phone, color: Colors.orange),
                    SizedBox(width: 10),
                    Text(
                      '0812 3456 7890',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Alamat Pengguna
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on, color: Colors.orange),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Jl. Raya No. 10, Jakarta Selatan, Indonesia',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Metode Pembayaran
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.credit_card, color: Colors.orange),
                    SizedBox(width: 10),
                    Text(
                      'VISA **** 1234',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 30),

                // Tombol Logout dengan ikon
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.exit_to_app, size: 30, color: Colors.red), // Ikon logout
                      onPressed: () {
                        // Tambahkan aksi logout di sini
                        print("Logout clicked");
                      },
                    ),
                    Text(
                      'Logout',
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: Bottomnavbar(), // Panggil Footer di sini
    );
  }
}
