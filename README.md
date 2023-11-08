----- TUGAS 6 ------

Nama   : Clarista <br/>
NPM    : 2206815541

1. Perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter<br/>
`Stateless Widget:`<br/>
Stateless widget adalah widget yang tidak memiliki perubahan internal (state) selama aplikasi masih berjalan. Stateless widget cocok digunakan untuk elemen UI yang tidak perlu diperbarui atau tidak berubah selama aplikasi berjalan. Stateless widget tidak memiliki metode `setState()`, sehingga tidak dapat memperbarui tampilan secara dinamis. Contoh penggunaan stateless widget dalam kode yang Anda berikan adalah widget `ShopCard`. <br/>

`Stateful Widget:`<br/>
Stateful widget adalah widget yang memiliki perubahan internal (state) yang dapat diperbarui selama aplikasi berjalan. Ini digunakan untuk elemen UI yang memerlukan pembaruan tampilan berdasarkan perubahan data atau interaksi pengguna. Stateful widget memiliki metode `setState()`, yang memungkinkan Anda memperbarui tampilan ketika ada perubahan state. Contoh penggunaan stateful widget dalam Flutter biasanya melibatkan widget seperti `ListView`, `TextField`, dan lainnya yang perlu bereaksi terhadap input atau perubahan data.

2. Widget yang saya gunakan untuk menyelesaikan tugas ini dan fungsinya:

- `MyHomePage` (Stateless Widget):<br/>
Widget ini adalah halaman utama aplikasi yang menampilkan daftar tombol untuk berbagai tindakan. Ini menggunakan `GridView` untuk menampilkan daftar `ShopCard` berdasarkan `ShopItem`. `MyHomePage` memiliki metode `build()` yang menggambarkan tampilan halaman.

- `ShopCard` (Stateless Widget):<br/>
Widget ini digunakan untuk menampilkan kartu dengan ikon dan teks yang mewakili tindakan yang dapat dilakukan oleh pengguna. Menerima `ShopItem` sebagai argumen konstruktor untuk menentukan ikon dan teks yang akan ditampilkan. Ketika card diklik, dia menampilkan SnackBar untuk memberi tahu pengguna action apa yang dilakukan.

- `ShopItem` (Kelas Model):<br/>
Kelas ini digunakan untuk mewakili barang-barang yang dapat ditampilkan dalam daftar tombol. Setiap `ShopItem` memiliki nama (teks) dan ikon (IconData) yang berkaitan dengan action yang akan diambil oleh pengguna.

3. Implementasi Checklist Step-by-Step:

- Mengganti tema warna aplikasi menjadi berbagai warna:
   - Mengubah `colorScheme` dalam MaterialApp untuk menggunakan warna dari getButtonColor.

- Mengubah sifat widget halaman menu menjadi stateless:
   - Mengganti `MyHomePage` dari `StatefulWidget` menjadi `StatelessWidget`.

- Menambahkan daftar barang-barang yang simpan dalam `MyHomePage`:
   - Membuat list `ShopItem` yang mewakili tombol-tombol yang akan ditampilkan.

- Menampilkan daftar tombol menggunakan `GridView`:
   - Menggunakan `GridView.count` untuk menampilkan daftar `ShopCard` berdasarkan `ShopItem`.

- Membuat `ShopCard` sebagai widget stateless:
   - Membuat widget `ShopCard` yang menerima `ShopItem` sebagai argumen konstruktor.
   - Menggunakan `Material` dan `InkWell` untuk membuat kartu responsif terhadap sentuhan (onTap).
   - Menampilkan ikon dan teks berdasarkan `ShopItem` yang diberikan.
   - Menampilkan SnackBar ketika card diklik.

