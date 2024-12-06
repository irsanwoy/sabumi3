import 'package:flutter/material.dart';
import 'register.dart';
import 'dashboard.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Dashboard()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                            backgroundColor: Colors.blueAccent,
                          ),
                          child: Text('Login', style: TextStyle(fontSize: 18)),
                        ),
                        SizedBox(height: 20),
                        // Tombol untuk pergi ke halaman registrasi
                        TextButton(
                          onPressed: () {
                            // Aksi saat tombol registrasi ditekan
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Register()),
                            );
                          },
                          child: Text(
                            'Belum punya akun? Daftar sekarang',
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


