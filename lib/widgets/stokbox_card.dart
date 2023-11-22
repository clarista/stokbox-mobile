import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:stokbox/screens/list_product.dart';
import 'package:stokbox/screens/login.dart';
// import 'package:stokbox/screens/menu.dart';
import 'package:stokbox/screens/stokbox_form.dart';
// import 'package:stokbox/screens/stokbox_item.dart';

class ShopItem {
  final String nomor;
  final String name;
  final IconData icon;

  ShopItem(this.nomor, this.name, this.icon);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;
  final Color color;

  const ShopCard(this.item, this.color, {Key? key}) : super(key: key);
  // const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: color,
      child: InkWell(
        // Area responsif terhadap sentuhan
        onTap: () async {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Tambah Item") {
            // TODO: Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopFormPage(),
                ));
          }
          else if (item.name == "Lihat Item") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ProductPage()));
          }
          else if (item.name == "Logout") {
            final response = await request.logout(
                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                "http://localhost:8000/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Sampai jumpa, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
          }
        },
        //   if (item.name == "Lihat Item") {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => ProductListPage(productList: productList)
        //       ));
        //   }

        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   item.nomor,
                //   textAlign: TextAlign.center,
                //   style: const TextStyle(color: Colors.white),
                // ),
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