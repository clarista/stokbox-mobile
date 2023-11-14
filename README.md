<details>
<summary>Tugas 8</summary>

Nama   : Clarista <br/>
NPM    : 2206815541

1. Perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()` adalah
- `Navigator.push()` ini digunakan untuk menambahkan route ke dalam stack route yang ada di objek `Navigator`. Cara kerjanya mirip dengan tumpukan, dimana "item" terbaru akan berada di atas route yang sedang ditampilkan di page user. Contoh implementasinya adalah:
```
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) =>PageYangDituju()),
);
```
- `Navigator.pushReplacement()` ini digunakan untuk menghapus route yang sedang ditampilkan kepada user dan menggantinya dengan route lain. Pushreplacement ini membuat aplikasi berpindah dari route yang sedang ditampilkan kepada user ke suatu route yang diberikan. Contoh implementasinya adalah:
```
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) =>PageYangDituju()),
);
```
Perbedaan antara `navigation.push()` dan `navigation.pushReplacement()` adalah pada apa yang dilakukan kepada route yang berada pada atas stack. `Push` menambahkan route baru, sedangkan `pushReplacement` menggantikan route dengan route baru.

2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
Pada program saya, layout widget yang saya gunakan adalah:
- Container Widget: Container adalah widget yang serbaguna untuk mengatur tampilan tata letak dan dekorasi elemen-elemen dalam aplikasi. Mengatur properti seperti warna latar belakang, padding, margin, dan sebagainya. Ini berguna untuk mengatur tampilan dan tata letak umum dalam aplikasi

- ListView Widget: ListView digunakan ketika Anda memiliki daftar elemen yang panjang atau dinamis yang perlu ditampilkan dalam daftar gulir. Ini memungkinkan pengguna untuk menggulir daftar elemen dengan mudah.

- GridView Widget: GridView digunakan untuk mengatur elemen-elemen dalam bentuk grid (kotak atau baris dan kolom). Ini berguna untuk menampilkan elemen-elemen dalam grid seperti galeri foto atau grid produk dalam aplikasi belanja.

- Card Widget: Card adalah widget yang digunakan untuk menampilkan informasi dalam bentuk kartu yang memiliki bayangan dan sudut melengkung. Ini cocok untuk menampilkan informasi yang terkait, seperti entri daftar atau detail produk.

3.  Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
Elemen input yang saya pakai adalah TextFormField untuk menerima input nama item, amount, harga dan deskripsi. Saya menggunakan elemen input ini karena elemen ini cocok digunakan untuk mengumpulkan input dari pengguna dalam bentuk teks.

4. Bagaimana penerapan clean architecture pada aplikasi Flutter?
Clean architecture adalah sebuah pendekatan yang mengorganisir kode dalam lapisan-lapisan terpisah dan independen satu sama lain. Pendekatan ini bertujuan untuk meningkatkan struktur, uji, dan pemeliharaan aplikasi dengan memisahkan tanggung jawab yang berbeda.

Dalam konteks aplikasi Flutter, clean architecture memiliki tiga lapisan utama:

- Presentation Layer (Lapisan Presentasi):
Ini adalah lapisan yang berkaitan dengan antarmuka pengguna dan manajemen keadaan UI. Di sinilah elemen-elemen tampilan pengguna seperti widget Flutter dikelola.

- Business Logic Layer (Lapisan Logika Bisnis):
Lapisan ini berisi logika bisnis inti aplikasi yang terisolasi dari lapisan tampilan. Flutter umumnya menggunakan pola desain seperti BLoC (Business Logic Component), Provider, atau Redux untuk mengatur logika bisnis ini.

- Data Layer (Lapisan Data):
Ini adalah lapisan yang menangani akses ke data eksternal seperti panggilan API, basis data, penyimpanan lokal, atau sumber data lainnya yang mungkin diperlukan oleh aplikasi.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
Tentu, berikut ini adalah penjelasan langkah-langkahnya menggunakan "saya":

1. **Membuat Berkas Baru (left_drawer.dart)**:
   - Saya akan membuat berkas baru dengan nama `left_drawer.dart` di dalam direktori `widgets`.

2. **Tambahkan Widget Drawer**:
   - Dalam berkas `left_drawer.dart`, saya akan menambahkan widget `Drawer` yang berisi widget `ListView`. Ini akan menjadi tampilan menu drawer.

3. **Mengimpor Halaman**:
   - Saya akan mengimpor halaman yang ingin saya tambahkan ke drawer, seperti `MyHomePage` dan `ShopFormPage`, yang akan saya gunakan untuk navigasi.

4. **Menambahkan Navigasi ke Drawer**:
   - Saya akan menambahkan widget `ListTile` untuk setiap halaman yang ingin saya tambahkan ke menu drawer.
   - Saya akan menggunakan `Navigator.pushReplacement` untuk mengarahkan pengguna ke halaman baru saat salah satu opsi di drawer dipilih.

5. **Menghias Drawer**:
   - Saya dapat menambahkan dekorasi dan teks pada bagian header drawer untuk memberikan tampilan yang menarik.
   - Saya akan sesuaikan desain dan tata letak sesuai dengan kebutuhan desain aplikasi saya.

6. **Mengintegrasikan Drawer ke Halaman**:
   - Saya akan mengimpor drawer yang telah saya buat ke dalam halaman yang ingin memiliki drawer.
   - Saya akan masukkan drawer sebagai nilai parameter `drawer` pada widget `Scaffold` pada halaman tersebut.

7. **Menampilkan Data**:

   **Membuat Berkas Form Baru (shoplist_form.dart)**:
   - Saya akan membuat berkas baru dengan nama `shoplist_form.dart` di dalam direktori `lib`.
   - Dalam berkas ini, saya akan tambahkan widget `Scaffold` dengan `AppBar` dan drawer yang sudah saya buat sebelumnya.

   **Menambahkan Widget Form**:
   - Saya akan menggunakan widget `Form` sebagai wadah untuk bidang input.
   - Saya akan gunakan `SingleChildScrollView` untuk membuat form menjadi scrollable.

   **Mengimplementasikan Bidang Input**:
   - Saya akan tambahkan `TextFormField` untuk setiap elemen input yang dibutuhkan.
   - Saya akan menggunakan `Padding` dan `Column` untuk merapikan tata letak elemen input.

   **Validasi Input**:
   - Saya akan menggunakan atribut `onChanged` pada `TextFormField` untuk mendeteksi perubahan nilai.
   - Saya akan terapkan validasi dengan atribut `validator` untuk memastikan input sesuai kebutuhan.

   **Menampilkan Data pada AlertDialog**:
   - Saya akan menggunakan `showDialog` ketika formulir tervalidasi.
   - Saya akan tampilkan data yang dimasukkan oleh pengguna pada `AlertDialog`.
   - Saya akan reset formulir setelah data ditampilkan.

8. **Menambahkan Fitur Navigasi pada Tombol**:
   - Navigasi dari tombol pada `ShopItem`:
     - Dalam fungsi `onTap` pada widget `ShopItem`, saya akan menggunakan `Navigator.push` untuk melakukan navigasi ke halaman yang sesuai.

9. **Refactoring File**:
   - Membuat berkas baru untuk widget:
     - Saya akan membuat berkas dengan nama `shop_card.dart` di dalam direktori `widgets`.
   - Saya akan pindahkan konten widget `ShopItem` dari `menu.dart` ke `shop_card.dart`.
   - Mengimpor file ke dalam folder:
     - Saya akan membuat folder baru dengan nama `screens` di dalam direktori `lib`.
     - Saya akan pindahkan berkas `menu.dart` dan `shoplist_form.dart` ke dalam folder `screens`.
   - Saya akan memastikan refactoring dilakukan dengan IDE atau text editor yang mendukung Flutter.

</details>


<details>
<summary>Tugas 7</summary>
----- TUGAS 7 ------

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
   - Menampilkan SnackBar ketika card diklik. <br/>
   Saat tombol di dalam aplikasi Flutter yang telah saya buat ditekan, saya mengimplementasikan action untuk menampilkan Snackbar dengan pesan yang sesuai dengan tombol yang ditekan. Misalnya, ketika saya menekan tombol "Lihat Produk", maka akan muncul Snackbar dengan pesan "Kamu telah menekan tombol Lihat Produk!". Saat saya menekan tombol "Tambah Produk", Snackbar akan muncul dengan pesan "Kamu telah menekan tombol Tambah Produk!", dan ketika saya menekan tombol "Logout", Snackbar akan muncul dengan pesan "Kamu telah menekan tombol Logout!". Implementasi ini memungkinkan pesan yang ditampilkan dalam Snackbar untuk dinamis sesuai dengan action yang dilakukan oleh user, sehingga memberikan feedback yang jelas tentang action yang telah dilakukan dalam aplikasi.

</details>