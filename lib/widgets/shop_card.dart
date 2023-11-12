import 'package:flutter/material.dart';
import 'package:stokbox/screens/menu.dart';
import 'package:stokbox/screens/shoplist_form.dart';

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    
    // Tentukan warna untuk masing-masing tombol berdasarkan nama tombol
    if (item.name == "Lihat Item") {
      buttonColor = Colors.teal; // Warna latar belakang hijau
    } else if (item.name == "Tambah Item") {
      buttonColor = Colors.teal; // Warna latar belakang biru
    } else if (item.name == "Logout") {
      buttonColor = Colors.red.shade300; // Warna latar belakang merah
    } else {
      buttonColor = Colors.indigo; // Warna latar belakang default
    }

    return Material(
      //color: Colors.indigo,
      elevation: 5,
      color: buttonColor, // Gunakan warna yang telah ditentukan
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Tambah Item") {
            // Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
            Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopFormPage(),
                  ));
          }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}