import 'package:flutter/material.dart';
import 'package:sabumi3/screens/login.dart';
import 'dart:async';

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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()), // Ganti 'Home' dengan halaman utama Anda
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,  // Latar belakang putih
      body: Center(
        child: Image.network(
          'https://i.giphy.com/media/v1.Y2lkPTc5MGI3NjExMjFoNGN4MWozd3p4dTNhbGk0d2dvdmliNzY3M2tmdzdlNGxoNmx1diZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9cw/T6DUqJRCPy16jEJwMd/giphy.gif',  // URL GIF
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
