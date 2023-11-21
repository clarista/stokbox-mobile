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

- ListView Widget: ListView digunakan ketikamemiliki daftar elemen yang panjang atau dinamis yang perlu ditampilkan dalam daftar gulir. Ini memungkinkan pengguna untuk menggulir daftar elemen dengan mudah.

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

1. **Membuat Halaman Formulir Tambah Item Baru:**
   - Untuk membuat halaman baru, saya membuat sebuah widget StatefulWidget yang disebut `ShopFormPage` dalam berkas `stokbox_form.dart`. Widget ini akan menjadi halaman formulir tambah item baru.

   ```dart
   class ShopFormPage extends StatefulWidget {
       const ShopFormPage({super.key});
       @override
       State<ShopFormPage> createState() => _ShopFormPageState();
   }
   ```

   - Di dalam `_ShopFormPageState`, saya membuat sebuah formulir dengan widget `Form`. Saya juga menggunakan `GlobalKey<FormState>` untuk mengelola state formulir dan validasi.

   ```dart
   class _ShopFormPageState extends State<ShopFormPage> {
       final _formKey = GlobalKey<FormState>();
       String _name = "";
       int _amount = 0;
       int _price = 0;
       String _description = "";
   }
   ```

   - Selanjutnya, saya menambahkan elemen-elemen input seperti `TextFormField` untuk `name`, `amount`, dan `description`. Saya juga dapat menambahkan field `price`.

   ```dart
   Padding(
         padding: const EdgeInsets.all(8.0),
         child: TextFormField(
         decoration: InputDecoration(
            hintText: "Nama Item",
            labelText: "Nama Item",
            border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(5.0),
            ),
         ),
         onChanged: (String? value) {
            setState(() {
               _name = value!;
            });
         },
         validator: (String? value) {
            if (value == null || value.isEmpty) {
               return "Nama item tidak boleh kosong!";
            }
            return null;
         },
         ),
      ),
      Padding(
         padding: const EdgeInsets.all(8.0),
         child: TextFormField(
         decoration: InputDecoration(
            hintText: "Jumlah",
            labelText: "Jumlah",
            border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(5.0),
            ),
         ),
         onChanged: (String? value) {
            setState(() {
               _amount = int.parse(value!);
            });
         },
         validator: (String? value) {
            if (value == null || value.isEmpty) {
               return "Jumlah tidak boleh kosong!";
            }
            if (int.tryParse(value) == null) {
               return "Jumlah harus berupa angka!";
            }
            return null;
         },
         ),
      ),
      Padding(
         padding: const EdgeInsets.all(8.0),
         child: TextFormField(
         decoration: InputDecoration(
            hintText: "Harga",
            labelText: "Harga",
            border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(5.0),
            ),
         ),
         onChanged: (String? value) {
            setState(() {
               _price = int.parse(value!);
            });
         },
         validator: (String? value) {
            if (value == null || value.isEmpty) {
               return "Harga tidak boleh kosong!";
            }
            if (int.tryParse(value) == null) {
               return "Harga harus berupa angka!";
            }
            return null;
         },
         ),
      ),
      Padding(
         padding: const EdgeInsets.all(8.0),
         child: TextFormField(
         decoration: InputDecoration(
            hintText: "Deskripsi",
            labelText: "Deskripsi",
            border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(5.0),
            ),
         ),
         onChanged: (String? value) {
            setState(() {
               _description = value!;
            });
         },
         validator: (String? value) {
            if (value == null || value.isEmpty) {
               return "Deskripsi tidak boleh kosong!";
            }
            return null;
         },
         ),
      ),
   
   ```

2. Di halaman utama, tambahkan tombol "Tambah Item" dengan menggunakan widget ElevatedButton atau TextButton dan tambahkan perintah navigasi ke halaman form tambah item saat tombol ditekan. 
```dart
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FormTambahItemPage()),
    );
  },
  child: Text("Tambah Item"),
)
```


3. Terakhir, setelah pengguna mengisi formulir dan menekan tombol **"Save"**, saya menampilkan data yang diisi dalam sebuah pop-up menggunakan `showDialog()`.

4. **Membuat Drawer:**
   - Untuk membuat drawer, saya membuat sebuah widget `LeftDrawer` dalam berkas `left_drawer.dart`. Widget ini akan menjadi drawer yang berisi opsi navigasi.

   ```dart
   Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigoAccent,
            ),
   ```
   - Pada bagian routing untuk opsi navigasi, saya dapat menggunakan `Navigator.pushReplacement()` untuk mengarahkan pengguna ke halaman yang sesuai saat opsi "Halaman Utama" atau "Tambah Item" dipilih.

   ```dart
   ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
      ListTile(
      leading: const Icon(Icons.add_shopping_cart),
      title: const Text('Tambah Item'),
      // Bagian redirection ke ShopFormPage
      onTap: () {
         Navigator.pushReplacement(
            context,
            MaterialPageRoute(
               builder: (context) => ShopFormPage(),
            ));
      },
      ),
      ListTile(
      leading: const Icon(Icons.view_list),
      title: const Text('Lihat Item'),
      onTap: () {
         Navigator.pushReplacement(
            context,
            MaterialPageRoute(
            builder: (context) => ProductListPage(productList: productList),
            ));
      },
      )
   ```


</details>


<details>
<summary>Tugas 7</summary>
----- TUGAS 7 ------

Nama   : Clarista <br/>
NPM    : 2206815541

1. Perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter<br/>
`Stateless Widget:`<br/>
Stateless widget adalah widget yang tidak memiliki perubahan internal (state) selama aplikasi masih berjalan. Stateless widget cocok digunakan untuk elemen UI yang tidak perlu diperbarui atau tidak berubah selama aplikasi berjalan. Stateless widget tidak memiliki metode `setState()`, sehingga tidak dapat memperbarui tampilan secara dinamis. Contoh penggunaan stateless widget adalah widget `ShopCard`. <br/>

`Stateful Widget:`<br/>
Stateful widget adalah widget yang memiliki perubahan internal (state) yang dapat diperbarui selama aplikasi berjalan. Ini digunakan untuk elemen UI yang memerlukan pembaruan tampilan berdasarkan perubahan data atau interaksi pengguna. Stateful widget memiliki metode `setState()`, yang memungkinkan kita memperbarui tampilan ketika ada perubahan state. Contoh penggunaan stateful widget dalam Flutter biasanya melibatkan widget seperti `ListView`, `TextField`, dan lainnya yang perlu bereaksi terhadap input atau perubahan data.

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




<details>
<summary> Tugas 9 </summary>

1. **Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?**

Ya, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Pengambilan data JSON adalah proses membaca atau mengonsumsi data yang dikirimkan dalam format JSON. Ini bisa dilakukan dengan menggunakan bahasa pemrograman yang mendukung pengolahan JSON atau melalui library khusus yang ada dalam banyak bahasa pemrograman. Sedangkan pembuatan model seringkali terkait dengan kebutuhan analisis data yang lebih dalam, seperti pembelajaran mesin (machine learning) di mana Anda ingin membuat model berdasarkan data yang Anda miliki.

Apakah lebih baik melakukan pengambilan data JSON tanpa membuat model terlebih dahulu atau tidak tergantung pada kebutuhan dan tujuan Anda:
- Jika tujuannya hanya untuk mengakses atau menampilkan data JSON yang diterima dari suatu API atau sumber data lainnya, lebih baik tidak membuat model.
- Jika tujuannya untuk menganalisis data lebih lanjut, memprediksi pola, atau membuat rekomendasi berdasarkan data tersebut, perlu membangun model.

2. **Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.**

CookieRequest berfungsi untuk mengelola permintaan request yang berhubungan dengan cookie dalam aplikasi. Dimana class ini akan menngatur hal-hal yang berkaitan dengan data yang disimpan di sisi cllient untuk melacak informasi terkait sesi pengguna.

Instance CookieRequest perlu dibagikan ke semua komponen untuk memastikan bahwa manajemen cookie dilakukan dengan cara yang seragam di semua komponen dalam aplikasi tersebut sehingga sesi pengguna akan dipelihata dengan konsisten.

3. **Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.**

- Gunakan package dan library yang diperlukan, contohnya http dan convert.
```dart
import 'package:http/http.dart' as http;
import 'dart:convert';
```
- Fetch data menggunakan HTTP untuk meminta data dari server yang memiliki data JSON tersebut.
```dart
  Future<List<Item>> fetchItem() async {
    var response = await http.get(
      Uri.parse(
        //'http://fredo-melvern-tugas.pbp.cs.ui.ac.id/json/'
        'http://127.0.0.1:8000/json/'
        //'http://127.0.0.1:8000/get-flutter/'
        );,
      headers: {"Content-Type": "application/json"},
    );
  }
```
- Parsing atau convert response tersebut ke dalam bentuk JSON.
```dart
Future<void> getData() async {
  try {
    var jsonData = await fetchData();
    List<dynamic> dataList = jsonData.body;

  } catch (e) {
    print('Error: $e');
  }
}
```
- Menampilkan data di flutter contohnya menggunakan ListView.builder

```dart
ListView.builder(
  itemCount: dataList.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(dataList[index]['title']),
      subtitle: Text(dataList[index]['description']),
    );
  },
);
```

4. **Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.**

Pertama menggunakan package `pbp_django_auth`, dibuat CookieRequest baru masukkan ke variabel bernama request.
```dart
final request = context.watch<CookieRequest>();
```

Pada `login.dart`, aplikasi akan meminta input teks berupa username & password. Ketika disubmit, akan dipanggil:
```dart
final response = await request.login(
  "http://127.0.0.1:8000/auth/login/",
  {
    'username': username,
    'password': password
  }
);
```
dimana username dan password tersebut akan dikirmkan request ke projek Django agar user di authenticate & login. Jika sukses akan mengembalikan JsonResponse sukses, dan gagal jika sebaliknya.
```dart

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)
```

5. **Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.**

- TextField : menerima input teks dari pengguna. Pada tugas ini digunakan untuk menerima username dan password saat login dan registrasi.
- SizedBox : membuat ruang tertentu. Pada tugas ini dugnakan untuk memberikan jarak atau pemisah antara TextField username dan passowrd.
- ElevatedButton : membuat tombol yang memiliki efek elevasi ketika ditekan. Pada tugas ini digunakan sebagai tombol submit pada saat login dan registrasi.
- TextButton : membuat tombol berupa teks tanpa latar belakang. Pada tugas ini digunakan pada tombol registrasi
- Listview.builder : membuat daftar item yang dapat discroll. Pada tugas ini digunakan untuk menampilkan daftar item yang ada.
- Text : membuat teks. Pada tugas ini digunakann untuk menampilkan teks detail saat item pada daftar item ditekan.


6. **Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).**
</details>