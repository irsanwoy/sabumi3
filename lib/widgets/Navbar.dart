import 'package:flutter/material.dart';
import 'package:sabumi3/screens/dashboard.dart';
import 'package:sabumi3/screens/kuliner.dart';
import 'package:sabumi3/screens/wisata.dart';

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Wisata()),
                  );
                },
                child: Text(
                  'Wisata', 
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lemonada', // Gunakan font Lemonada
                    fontSize: 18, // Ukuran font sesuai keinginan
                  ),
                ),
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Kuliner()),
                  );
                },
                child: Text(
                  'Kuliner', 
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lemonada', // Gunakan font Lemonada
                    fontSize: 18, // Ukuran font sesuai keinginan
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
