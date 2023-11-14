
import 'package:flutter/material.dart';
// Impor drawer widget
import 'package:stokbox/widgets/left_drawer.dart';
// Impor shop_card
import 'package:stokbox/widgets/stokbox_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist),
    ShopItem("Tambah Item", Icons.add_shopping_cart),
    ShopItem("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stokbox'),
        backgroundColor: Colors.indigo[300],
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Welcome To Stokbox', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.asMap().entries.map((entry) {
                // Iterasi untuk setiap item
                int index = entry.key;
                ShopItem item = entry.value;
                Color color = Colors.white;
                if (index == 0) {
                  color = Colors.indigo.shade400;
                } else if (index == 1) {
                  color = Colors.indigo.shade400;
                } else if (index == 2) {
                  color = Colors.red.shade200;
                }
                return ShopCard(item, color);
                }).toList(),
                ),

            ],
          ),
        ),
      ),
    );
  }
}