import 'package:flutter/material.dart';
import 'package:sabumi3/screens/dashboard.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFFF77437),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo Sabumi di sebelah kiri dengan InkWell untuk beralih ke halaman Dashboard
          InkWell(
            onTap: () {
              // Aksi saat logo ditekan
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                'assets/logo.png',
                width: 130, // Sesuaikan ukuran logo
              ),
            ),
          ),
          // Tombol untuk masuk ke screen Wisata dan Kuliner di sebelah kanan
          Row(
            children: [
              TextButton(
                onPressed: () {
                  // Aksi untuk masuk ke screen Wisata
                  print("Navigating to Wisata screen...");
                },
                child: Text('Wisata', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  // Aksi untuk masuk ke screen Kuliner
                  print("Navigating to Kuliner screen...");
                },
                child: Text('Kuliner', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Mendefinisikan ukuran appBar
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // Ukuran default AppBar
}
