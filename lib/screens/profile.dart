import 'package:flutter/material.dart';
import 'package:sabumi3/widgets/navbar.dart';
import 'package:sabumi3/widgets/BottomNavbar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: Navbar(), // Pastikan Navbar() mengembalikan widget AppBar

      body: Column(
        children: [
          // Body utama dengan konten yang scrollable
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: screenHeight, // Pastikan Container ini mengisi seluruh tinggi layar
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF2C2C2C),
                      Color(0xFF505050),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Bagian Avatar
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('assets/profile.png'),
                      ),
                      SizedBox(height: 20),
                      
                      // Nama Pengguna
                      Text(
                        'Nama Pengguna',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      
                      // Card untuk informasi kontak
                      Card(
                        elevation: 4,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: Colors.black54,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
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
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.email, color: Colors.orange),
                                  SizedBox(width: 10),
                                  Text(
                                    'email@example.com',
                                    style: TextStyle(fontSize: 18, color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.location_on, color: Colors.orange),
                                  SizedBox(width: 10),
                                  Text(
                                    'Alamat Pengguna',
                                    style: TextStyle(fontSize: 18, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          Bottomnavbar(),
        ],
      ),
    );
  }
}
