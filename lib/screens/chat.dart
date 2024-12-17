import 'package:flutter/material.dart';
import 'package:sabumi3/widgets/navbar.dart'; // Periksa path ini
import 'package:sabumi3/widgets/BottomNavbar.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> _messages = [];

  // Fungsi untuk menambahkan pesan
  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add({
          'sender': 'You', // Pesan dari pengguna
          'message': _controller.text,
        });
        _controller.clear(); // Clear input text field
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(), // Menampilkan Navbar
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // List pesan yang sudah ada
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Align(
                    alignment: message['sender'] == 'You'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: message['sender'] == 'You' ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        message['message']!,
                        style: TextStyle(color: message['sender'] == 'You' ? Colors.white : Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Input teks dan tombol kirim pesan
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: TextStyle(color: Colors.white), // Menetapkan warna teks menjadi putih
                      decoration: InputDecoration(
                        hintText: "Tulis pesan...",
                        hintStyle: TextStyle(color: Colors.white), // Menetapkan warna hintText menjadi putih
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
      bottomNavigationBar: Bottomnavbar(), // Menampilkan footer atau bottom navbar
    );
  }
}
