import 'package:flutter/material.dart';
import 'package:sabumi3/widgets/navbar.dart';
import 'package:sabumi3/widgets/BottomNavbar.dart';
import 'package:sabumi3/screens/splash_screen.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF2C2C2C),
                  Color(0xFF505050),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Konten di atas background
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Bagian Header
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFF77437),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  const AssetImage('assets/profile.png'),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'irsanwoy@gmail.com',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Informasi Pengguna
                      _buildInfoRow("NO HP", "08999963287"),
                      _buildInfoRow("ALAMAT", "Cianjur, Pamoyanan no 27"),
                      _buildPaymentMethods(),
                      _buildInfoRow(
                          "RIWAYAT", "Kuliner (11 item)\nWisata (2 tiket)"),
                      const SizedBox(height: 30),
                      // Tombol Logout
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SplashScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF77437),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "LOG OUT",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Bottomnavbar(),
            ],
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membangun baris informasi
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label : ",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk metode pembayaran
  Widget _buildPaymentMethods() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "PAYMENT : ",
            style: TextStyle(
              fontSize: 16,
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Wrap(
              spacing: 8,
              children: const [
                Text(
                  "[DEBIT]",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  "[GOPAY]",
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
                Text(
                  "[DANA]",
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
