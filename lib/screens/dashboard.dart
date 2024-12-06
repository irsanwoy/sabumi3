import 'package:flutter/material.dart';
import 'package:sabumi3/widgets/navbar.dart';  // Periksa path ini

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),  // Pastikan Navbar dipanggil dengan benar di sini
      body: Center(
        child: Text('Welcome to the Dashboard!'),
      ),
    );
  }
}
