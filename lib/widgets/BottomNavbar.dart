import 'package:flutter/material.dart';
import 'package:sabumi3/screens/profile.dart';
import 'package:sabumi3/screens/chat.dart';
import 'package:sabumi3/screens/keranjang.dart';

class Bottomnavbar extends StatelessWidget {
  const Bottomnavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xFFF77437), 
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0), 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Ikon Chat
            Padding(
              padding: const EdgeInsets.only(top: 10.0), 
              child: IconButton(
                icon: Icon(Icons.chat, color: Colors.white, size: 30), 
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatPage()),
                  );
                },
              ),
            ),
            
            // Ikon Keranjang
            Padding(
              padding: const EdgeInsets.only(top: 10.0), 
              child: IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white, size: 30), 
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Keranjang()),
                  );
                },
              ),
            ),
            
            // Ikon Profile
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: IconButton(
                icon: Icon(Icons.account_circle, color: Colors.white, size: 30), 
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
