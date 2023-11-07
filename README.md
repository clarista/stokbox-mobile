Nama   : Clarista
NPM    : 2206815541

Perbedaan Utama antara Stateless dan Stateful Widget dalam Konteks Pengembangan Aplikasi Flutter:

1. Stateless Widget:
   - Stateless widget adalah widget yang tidak memiliki perubahan internal (state) selama hidup aplikasi.
   - Ini cocok digunakan untuk elemen UI yang tidak perlu diperbarui atau tidak berubah selama aplikasi berjalan.
   - Stateless widget tidak memiliki metode `setState()`, sehingga tidak dapat memperbarui tampilan secara dinamis.
   - Contoh penggunaan stateless widget dalam kode yang Anda berikan adalah widget `ShopCard`.

2. Stateful Widget:
   - Stateful widget adalah widget yang memiliki perubahan internal (state) yang dapat diperbarui selama aplikasi berjalan.
   - Ini digunakan untuk elemen UI yang memerlukan pembaruan tampilan berdasarkan perubahan data atau interaksi pengguna.
   - Stateful widget memiliki metode `setState()`, yang memungkinkan Anda memperbarui tampilan ketika ada perubahan state.
   - Contoh penggunaan stateful widget dalam Flutter biasanya melibatkan widget seperti `ListView`, `TextField`, dan lainnya yang perlu bereaksi terhadap input atau perubahan data.

Widget yang Digunakan untuk Menyelesaikan Tugas Ini dan Fungsinya:

1. `MyHomePage` (StatelessWidget):
   - Widget ini adalah halaman utama aplikasi yang menampilkan daftar tombol untuk berbagai tindakan.
   - Ini menggunakan `GridView` untuk menampilkan daftar `ShopCard` berdasarkan `ShopItem`.
   - `MyHomePage` memiliki metode `build()` yang menggambarkan tampilan halaman.

2. `ShopCard` (StatelessWidget):
   - Widget ini digunakan untuk menampilkan kartu dengan ikon dan teks yang mewakili tindakan yang dapat dilakukan oleh pengguna.
   - Menerima `ShopItem` sebagai argumen konstruktor untuk menentukan ikon dan teks yang akan ditampilkan.
   - Ketika kartu diklik, ia menampilkan SnackBar untuk memberi tahu pengguna tindakan yang dilakukan.

3. `ShopItem` (Kelas Model):
   - Kelas ini digunakan untuk mewakili barang-barang yang dapat ditampilkan dalam daftar tombol.
   - Setiap `ShopItem` memiliki nama (teks) dan ikon (IconData) yang berkaitan dengan tindakan yang akan diambil oleh pengguna.

Implementasi Checklist Step-by-Step:

1. Mengganti tema warna aplikasi menjadi indigo:
   - Mengubah `colorScheme` dalam MaterialApp untuk menggunakan warna indigo.

2. Mengubah sifat widget halaman menu menjadi stateless:
   - Mengganti `MyHomePage` dari `StatefulWidget` menjadi `StatelessWidget`.

3. Menambahkan daftar barang-barang yang dijual dalam `MyHomePage`:
   - Membuat list `ShopItem` yang mewakili tombol-tombol yang akan ditampilkan.

4. Menampilkan daftar tombol menggunakan `GridView`:
   - Menggunakan `GridView.count` untuk menampilkan daftar `ShopCard` berdasarkan `ShopItem`.

5. Membuat `ShopCard` sebagai widget stateless:
   - Membuat widget `ShopCard` yang menerima `ShopItem` sebagai argumen konstruktor.
   - Menggunakan `Material` dan `InkWell` untuk membuat kartu responsif terhadap sentuhan.
   - Menampilkan ikon dan teks berdasarkan `ShopItem` yang diberikan.
   - Menampilkan SnackBar ketika kartu diklik.

Dengan langkah-langkah di atas, Anda telah mengimplementasikan daftar tombol dengan warna-warna yang berbeda untuk setiap tombol dan menjadikannya responsif terhadap interaksi pengguna.
