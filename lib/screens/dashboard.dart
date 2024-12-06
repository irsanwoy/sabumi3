import 'package:flutter/material.dart';

// Model untuk menu-item di dashboard
class DashboardItem {
  final String title;
  final IconData icon;
  final Color color;

  DashboardItem({required this.title, required this.icon, required this.color});
}

class Dashboard extends StatelessWidget {
  // Daftar item untuk dashboard
  final List<DashboardItem> dashboardItems = [
    DashboardItem(title: 'Sales', icon: Icons.shopping_cart, color: Colors.blue),
    DashboardItem(title: 'Products', icon: Icons.production_quantity_limits, color: Colors.orange),
    DashboardItem(title: 'Users', icon: Icons.people, color: Colors.green),
    DashboardItem(title: 'Reports', icon: Icons.bar_chart, color: Colors.purple),
    DashboardItem(title: 'Settings', icon: Icons.settings, color: Colors.red),
    DashboardItem(title: 'Support', icon: Icons.help, color: Colors.teal),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Menampilkan 2 kolom
          crossAxisSpacing: 16, // Jarak antar kolom
          mainAxisSpacing: 16,  // Jarak antar baris
        ),
        itemCount: dashboardItems.length,
        itemBuilder: (context, index) {
          final item = dashboardItems[index];
          return GestureDetector(
            onTap: () {
              // Aksi ketika card ditekan (misalnya pindah ke halaman baru)
              print('Tapped on ${item.title}');
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              color: item.color,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item.icon, size: 40, color: Colors.white),
                    SizedBox(height: 10),
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

