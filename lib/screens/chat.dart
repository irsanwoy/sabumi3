import 'package:flutter/material.dart';
import 'package:sabumi3/widgets/navbar.dart'; // Pastikan path benar
import 'package:sabumi3/widgets/BottomNavbar.dart'; // Pastikan path benar

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Map<String, String>> _messages = [];

  // Fungsi untuk mengirim pesan dan memberikan respons dinamis
  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      String userMessage = _controller.text.toLowerCase().trim();

      setState(() {
        // Tambahkan pesan dari pengguna ke daftar pesan
        _messages.add({
          'sender': 'You',
          'message': _controller.text,
        });
        _controller.clear(); // Kosongkan input field
      });

      _scrollToBottom(); // Scroll ke bawah

      // Simulasi balasan bot setelah delay 2 detik
      Future.delayed(Duration(seconds: 2), () {
        String botReply = _generateBotReply(userMessage);

        setState(() {
          _messages.add({
            'sender': 'Bot',
            'message': botReply,
          });
        });

        _scrollToBottom(); // Scroll ke bawah lagi
      });
    } else {
      print("Input kosong, tidak ada pesan yang dikirim.");
    }
  }

  // Fungsi untuk memberikan respons berdasarkan input pengguna
  String _generateBotReply(String message) {
    if (message.contains("apa itu sabumi")) {
      return "SABUMI adalah aplikasi digital yang membantu wisatawan merencanakan perjalanan wisata alam ke Savillage Puncak dan menikmati kuliner khas Sunda di Rumah Makan Bumi Aki.";
    } else if (message.contains("apa itu savillage")) {
      return "Savillage adalah destinasi wisata alam yang indah di Puncak, Bogor. Cocok untuk rekreasi bersama keluarga dan menikmati pemandangan pegunungan.";
    } else if (message.contains("apa itu bumi aki")) {
      return "Bumi Aki adalah restoran khas Sunda yang menyajikan hidangan lezat dengan suasana nyaman di Puncak, Bogor.";
    } else if (message.contains("halo") || message.contains("hai")) {
      return "Halo! Selamat datang di SABUMI. Ada yang bisa saya bantu?";
    } else {
      return "Maaf, saya belum mengerti pertanyaan Anda. Coba tanyakan tentang 'Sabumi', 'Savillage', atau 'Bumi Aki'.";
    }
  }

  // Fungsi untuk scroll ke bawah
  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(), // Navbar
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'), // Background Image
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // List Pesan
            Expanded(
              child: ListView.builder(
                controller: _scrollController, // Scroll Controller
                padding: const EdgeInsets.all(10),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Align(
                    alignment: message['sender'] == 'You'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: message['sender'] == 'You'
                            ? Colors.blue
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        message['message']!,
                        style: TextStyle(
                          color: message['sender'] == 'You'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Input dan Tombol Kirim
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Tulis pesan...",
                        hintStyle: TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.blue),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Bottomnavbar(), // Bottom Navbar
    );
  }
}
