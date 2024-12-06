import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startSplashScreen();
  }

  // Fungsi untuk berpindah ke halaman utama setelah beberapa detik
  _startSplashScreen() {
    Timer(Duration(seconds: 5), () {
      // Setelah 3 detik, pindah ke halaman utama (Home)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => home()), // Ganti 'Home' dengan halaman utama Anda
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,  // Latar belakang putih
      body: Center(
        child: Image.network(
          'https://miro.medium.com/v2/resize:fit:1400/1*MDJziEY9NugG7ar2Tzsc-A.gif',  // URL GIF
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
