import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Mengisi seluruh layar
        children: [
          // Gambar latar belakang
          Image.asset(
            'assets/bg.jpg',
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
                    'assets/logo.png',
                    height: 300, // Ukuran logo
                  ),
                  SizedBox(height: 20),
                  // Form Register
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
                        // Input Email
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
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
                        // Tombol Daftar
                        ElevatedButton(
                          onPressed: () {
                            // Aksi saat tombol daftar ditekan
                            print('Registrasi Button Pressed');
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                            backgroundColor: Colors.blueAccent,
                          ),
                          child: Text('Daftar', style: TextStyle(fontSize: 18)),
                        ),
                        SizedBox(height: 20),
                        // Tombol untuk pergi ke halaman login
                        TextButton(
                          onPressed: () {
                            // Aksi saat tombol login ditekan
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Sudah punya akun? Login sekarang',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
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
