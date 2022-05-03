# RedStore-App

<img src="https://img.shields.io/badge/Type-App%2FAplikasi-green" alt="Type : App/Aplikasi"> <img src="https://img.shields.io/badge/-Assignment-red" alt="Assignment">

### Hello👋

Language : English

---

Description :\
  Contains a simple example of an Online Store Application information system that has implemented a database from a local server/localhost.

Operating system I use: Windows\
Required Software:
- XAMPP
- VSCode (with flutter plugin already installed)

Instructions:
- Clone this repo or download this repo.
- The "RedStore" folder uses VSCode to run Laravel.
- Folder "red_store" uses VSCode to run Flutter code.

## Create Database

> Create a database in PhpMyAdmin with the name "redstore".\
> Then open terminal in **RedStore** folder to run command `php artisan migrate`.

## For Mac OS
> For Mac OS users, head over to **RedStore-App/red_store/lib/screens/HomePage.dart**.
> Then edit all urls `http://10.0.2.2:8000` to `http://127.0.0.1:8000`.

It's on the line of code
```dart
class _HomePageState extends State<HomePage> {
 final String url = 'http://10.0.2.2:8000/api/products';
```
and 
```dart
Future deleteProduct(String productId) async {
  String url = "http://10.0.2.2:8000/api/products/" + productId;

  var response = await http.delete(Uri.parse(url));
  return json.decode(response.body);
}
```

---

Reference :\
 [Tutorial CRUD lengkap Laravel 8 + Flutter, Buat aplikasi Toko Online android dan IOS](https://youtu.be/G2oentJ5NVE)
