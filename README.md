# RedStore-App

### Hello👋

Tipe : App/Aplikasi {Assignment/Tugas}
(Toko Online)
Bahasa : Inggris

---

Deskripsi : 
  Berisi mengenai contoh sederhana sistem informasi Aplikasi Toko Online yang sudah saya menerapkan database dari server lokal/localhost.

Perangkat yang digunakan : Windows 
Perangkat Lunak Yang diperlukan :
- XAMPP
- VSCode (with flutter plugin already installed)

Instruksi :
- Clone repo ini atau unduh repo ini
- Folder "RedStore" menggunakan VSCode untuk menjalankan Laravel.
- Buka terminal di folder RedStore lalu jalankan `php artisan serve`.
- Folder "red_store" menggunakan VSCode untuk menjalankan Flutter code. 
  
> Untuk pengguna Mac OS, pergilah menuju **RedStore-App/red_store/lib/screens/HomePage.dart**.
> Lalu edit semua url `http://10.0.2.2:8000` menjadi `http://127.0.0.1:8000`.

Ada pada baris kode
```dart
class _HomePageState extends State<HomePage> {
 final String url = 'http://10.0.2.2:8000/api/products';
```
dan 

```dart
Future deleteProduct(String productId) async {
  String url = "http://10.0.2.2:8000/api/products/" + productId;

  var response = await http.delete(Uri.parse(url));
  return json.decode(response.body);
}
```
