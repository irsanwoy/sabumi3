import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Mengisi seluruh layar
        children: [
          // Gambar latar belakang
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover, // Menyesuaikan gambar dengan layar
          ),
          // Konten di atas gambar latar belakang
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo di atas
                  Image.asset(
                    'assets/images/logo.png',
                    height: 150, // Ukuran logo
                  ),
                  SizedBox(height: 40),
                  // Form Login
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        // Input Username
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Input Password
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                        SizedBox(height: 30),
                        // Tombol Login
                        ElevatedButton(
                          onPressed: () {
                            // Aksi saat tombol login ditekan
                            print('Login Button Pressed');
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                            primary: Colors.blueAccent,
                          ),
                          child: Text('Login', style: TextStyle(fontSize: 18)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
