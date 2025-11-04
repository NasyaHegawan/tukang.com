# Tukang.com App (Latihan UKL Paket 2)
Aplikasi Tukang.com ini merupakan project Flutter yang meniru tampilan dan alur aplikasi penyedia jasa tukang dengan halaman beranda interaktif, pesanan, pusat bantuan, dan akun pengguna.

# Tampilan Utama
Aplikasi terdiri dari 4 halaman utama yang diakses melalui Bottom Navigation Bar:

1. Beranda (DashboardPage)
   Menampilkan layanan utama, banner promo, partner resmi, partner finansial, berita, dan tips.

2. Pesanan (OrdersPage)
   Menampilkan daftar pesanan pengguna dengan status dan detail harga.

3. Bantuan (BantuanPage)
   Menyediakan daftar FAQ (pertanyaan umum) dan kontak dukungan pelanggan.

4. Akun (AccountPage)
   Menampilkan profil pengguna serta menu seperti alamat, pembayaran, bantuan, dan logout.

# Struktur File
Semua halaman masih berada dalam satu file main.dart, dengan struktur sebagai berikut:

lib/
└── main.dart

Namun, struktur ideal (jika dipisah per halaman) dapat dibuat seperti ini:

lib/
├── main.dart
├── pages/
│   ├── dashboard_page.dart
│   ├── orders_page.dart
│   ├── bantuan_page.dart
│   └── account_page.dart
└── widgets/
    └── reusable_widgets.dart

# Penjelasan Tiap Bagian Kode
1. main() & TukangApp
   Fungsi main() memanggil runApp() untuk menjalankan aplikasi.
   TukangApp adalah root widget bertipe StatelessWidget yang mengatur:
   - Judul aplikasi
   - Tema warna (kuning khas Tukang.com)
   - Halaman awal (SplashScreen)

2. SplashScreen
   Halaman pembuka berwarna kuning (#FFC107).
   Menampilkan logo aplikasi dari folder assets/images/logo.png.
   Setelah 2 detik (Future.delayed), berpindah otomatis ke halaman utama (MainShell).

3. MainShell
   Menggunakan BottomNavigationBar dengan 4 ikon:
   Beranda, Pesanan, Bantuan, dan Akun.
   Menampilkan halaman berdasarkan indeks yang dipilih (_pages[_idx]).

   final List<Widget> _pages = [
     DashboardPage(),
     OrdersPage(),
     BantuanPage(),
     AccountPage(),
   ];

4. DashboardPage
   Menampilkan konten utama aplikasi:
   Header logo dan sapaan pengguna
   Tiga kategori layanan utama
   Banner promo
   Partner resmi
   Partner finansial
   Berita dan tips dengan list horizontal

5. OrdersPage
   Menampilkan daftar pesanan pengguna (orders list dummy).
   Tiap item ditampilkan dengan ListTile di dalam Card.
   Klik pesanan membuka AlertDialog dengan detail.

6. BantuanPage
   Halaman pusat bantuan dengan:
   Daftar FAQ menggunakan ExpansionTile
   Kontak dukungan pelanggan (WhatsApp, Email, Jam Operasional)

7. AccountPage
   Halaman profil pengguna:
   Menampilkan nama, email, dan avatar
   Beberapa menu seperti Alamat Saya, Pembayaran, Bantuan & Dukungan, dan Keluar.

# Tema Warna

Elemen       | Warna     | Keterangan
------------- | ---------- | ------------
Primary       | #FFC107    | Kuning utama (SplashScreen)
Secondary     | #FFEB3B    | Kuning terang (AppBar)
Background    | #FFFFFF    | Putih bersih
Accent        | #FFA000    | Oranye aktif pada navigasi

# Fitur Dummy

Data layanan (services) dan pesanan (orders) masih bersifat statik (dummy).
Navigasi antar halaman sudah interaktif sepenuhnya.
Belum ada proses login, autentikasi, maupun integrasi API.

# Cara Kerja Program
1. Saat aplikasi dijalankan, tampil **Splash Screen** berwarna kuning dengan logo aplikasi.  
   Setelah 2 detik, aplikasi otomatis berpindah ke halaman utama (`MainShell`).

2. **MainShell** berisi navigasi bawah (BottomNavigationBar) dengan 4 menu utama.  
   Saat pengguna menekan salah satu ikon, konten akan berubah sesuai halaman yang dipilih.

3. Tiap halaman ditulis dalam widget terpisah, menggunakan struktur `Scaffold` dan `ListView`.

4. Data yang ditampilkan (layanan, pesanan, berita, tips) masih berupa **data dummy (statis)** di dalam kode, belum terhubung ke backend.

# Assets yang Dibutuhkan
ini ditambahkan ke pubspec.yaml:

flutter:
  assets:
    - assets/images/logo.png
    - assets/images/logotulisan.png
    - assets/images/icon_maintenance.png
    - assets/images/icon_build.png
    - assets/images/icon_design.png
    - assets/images/banner_promo.png
    - assets/images/macot_tukang.png
    - assets/images/logo_tegel.png
    - assets/images/logo_propan.png
    - assets/images/logo_indogress.png
    - assets/images/logo_solusi.png
    - assets/images/logo_kredivo.png
    - assets/images/logo_bfisyariah.png
    - assets/images/logo_griyaku.png
    - assets/images/logo_koinworks.png
    - assets/images/berita1.png
    - assets/images/berita2.png
    - assets/images/berita3.png
    - assets/images/berita4.png
    - assets/images/tips1.png
    - assets/images/tips2.png
    - assets/images/tips3.png
    - assets/images/tips4.png
    - assets/images/avatar.png

# 4. Screenshot Hasil Program

Berikut hasil tampilan dari masing-masing halaman aplikasi.

### Splash Screen
![Splash Screen](https://github.com/NasyaHegawan/tukang.com/blob/main/Screenshot_Slicing.jpg)

### Dashboard / Beranda
![Dashboard](https://github.com/NasyaHegawan/tukang.com/blob/main/Screenshot_Dasboard.jpg)

### Halaman Bantuan
![Bantuan Page](https://github.com/NasyaHegawan/tukang.com/blob/main/Screenshot_Bantuan.jpg)

### Halaman Akun
![Akun Page](https://github.com/NasyaHegawan/tukang.com/blob/main/Screenshot_Akun.jpg)

Juga saya simpan di Google Drive 
(https://drive.google.com/drive/folders/18v3RtpF_x9OKDc-ppA8phQOjxakUlI-r?usp=sharing)


## Dibuat oleh

Nasya Febrina Hegawan Putri
SMK Telkom Malang • XI RPL 7 Mobile Apps • Proyek Tampilan Flutter Latihan UKL Paket 2 2025
