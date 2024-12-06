import 'package:flutter/material.dart';
import 'package:sabumi3/widgets/navbar.dart'; // Periksa path ini


class Kuliner extends StatelessWidget {
  const Kuliner({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Navbar(),
      body: Text("Kuliner"),
    );
  }
}