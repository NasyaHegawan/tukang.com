import 'package:flutter/material.dart';

void main() => runApp(TukangApp());

class TukangApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tukang.com',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFFFEB3B),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black87),
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }
}

/* ---------------- Splash Screen ---------------- */
class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // simulate loading -> move to Dashboard
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => MainShell()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFC107), // warna kuning (#FFC107)
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: MediaQuery.of(context).size.width * 0.60,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

/* ---------------- Main Shell with Bottom Navigation ---------------- */
class MainShell extends StatefulWidget {
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _idx = 0;
final List<Widget> _pages = [
    DashboardPage(),
    OrdersPage(),
    BantuanPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_idx],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _idx,
        onTap: (i) => setState(() => _idx = i),
        unselectedItemColor: Colors.black54, iconSize: 24,
        selectedItemColor: Colors.orange,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outlined),
            label: 'Bantuan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}

/* ---------------- Dummy Data ---------------- */
class Service {
  final String title;
  final String subtitle;
  final String image;
  final double price;
  Service(this.title, this.subtitle, this.image, this.price);
}

List<Service> services = [
  Service(
    'Jasa Plumbing',
    'Perbaikan pipa & kebocoran',
    'assets/images/service_plumbing.png',
    120000,
  ),
  Service(
    'Jasa Listrik',
    'Perbaikan stop kontak & listrik',
    'assets/images/service_electrical.png',
    150000,
  ),
  Service(
    'Cleaning',
    'Bersih-bersih rumah & kantor',
    'assets/images/service_cleaning.png',
    90000,
  ),
];

class Order {
  final String id;
  final String service;
  final String date;
  final String status;
  final double price;
  Order(this.id, this.service, this.date, this.status, this.price);
}

List<Order> orders = [
  Order('#ORD001', 'Jasa Plumbing', '02 Nov 2025', 'Selesai', 120000),
  Order('#ORD002', 'Jasa Listrik', '28 Okt 2025', 'Dalam Proses', 150000),
  Order('#ORD003', 'Cleaning', '10 Okt 2025', 'Dibatalkan', 90000),
];

/* ---------------- Dashboard Page ---------------- */
class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === HEADER LOGO ===
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10,
                ),
                child: Image.asset('assets/images/logotulisan.png', height: 55),
              ),

              // === GREETING + 3 MENU ===
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 248, 240, 168),
                      Color.fromARGB(247, 255, 213, 0),
                    ],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hi, Nasya",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      "Pilih layanan yang sesuai dengan kebutuhan",
                      style: TextStyle(fontSize: 17),
                    ),
                    const SizedBox(height: 20),

                    // 3 Kategori Layanan
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      height: 150,
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _CategoryItem(
                            image: 'assets/images/icon_maintenance.png',
                            title: 'Home\nMaintenance',
                          ),
                          _CategoryItem(
                            image: 'assets/images/icon_build.png',
                            title: 'Build and\nRenovate',
                          ),
                          _CategoryItem(
                            image: 'assets/images/icon_design.png',
                            title: 'Design\nInspiration',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /* ---------------- BANNER PROMO ---------------- */
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset('assets/images/banner_promo.png'),
                ),
              ),

              const SizedBox(height: 24),

              // === OFFICIAL PARTNER STORE ===
              _sectionTitle("Official Partner Store"),
              const Text(
                "Pesan produk Barang / Jasa dadi Parter Resmi",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _partnerLogo('assets/images/logo_tegel.png'),
                    _partnerLogo('assets/images/logo_propan.png'),
                    _partnerLogo('assets/images/logo_indogress.png'),
                    _partnerLogo('assets/images/logo_solusi.png'),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // === FINANCIAL PARTNER ===
              _sectionTitle("Financial Partner"),
              const Text(
                "Solusi pembiayaan untuk proyek Renovasi",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _partnerLogo('assets/images/logo_kredivo.png'),
                    _partnerLogo('assets/images/logo_bfisyariah.png'),
                    _partnerLogo('assets/images/logo_griyaku.png'),
                    _partnerLogo('assets/images/logo_koinworks.png'),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // === BANNER KONSULTASI ===
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset('assets/images/macot_tukang.png'),
                ),
              ),

              const SizedBox(height: 24),

              // === BERITA ===
              _SectionTitle(title: 'Berita'),
              _HorizontalList(
                items: [
                  NewsItem(
                    'assets/images/berita1.png',
                    'Era Sudah Digital...',
                    '5 Oct 2021',
                  ),
                  NewsItem(
                    'assets/images/berita2.png',
                    'Benerin Dulu, Bayarnya...',
                    '28 Apr 2020',
                  ),
                  NewsItem(
                    'assets/images/berita3.png',
                    'Tukang.com Berbagi...',
                    '20 Mar 2020',
                  ),
                  NewsItem(
                    'assets/images/berita4.png',
                    'Buat rumah impianmu...',
                    '26 Mar 2024',
                  ),
                ],
              ),

              const SizedBox(height: 16),

              /* ---------------- TIPS ---------------- */
              _SectionTitle(title: 'Tips'),
              _HorizontalList(
                items: [
                  NewsItem(
                    'assets/images/tips1.png',
                    'Kenali Tanda Tanda...',
                    '10 Dec 2021',
                  ),
                  NewsItem(
                    'assets/images/tips2.png',
                    '10 Macam Jenis...',
                    '19 Dec 2020',
                  ),
                  NewsItem(
                    'assets/images/tips3.png',
                    'Manfaat Tanaman...',
                    '22 Jan 2022',
                  ),
                  NewsItem(
                    'assets/images/tips4.png',
                    'Tips punya rumah...',
                    '28 Jan 2023',
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // --- Komponen kecil (Widget Reusable) ---
  Widget _menuItem(IconData icon, String title) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(18),
          child: Icon(icon, color: Color(0xFFFFC107), size: 34),
        ),
        const SizedBox(height: 8),
        Text(title, textAlign: TextAlign.center),
      ],
    );
  }

  Widget _partnerLogo(String path) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Image.asset(path, height: 40),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _newsCard(String image, String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Container(
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                width: 140,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

/* ------------------------------------------------------------ */
/* ----------------- WIDGET REUSABLE --------------------------- */
/* ------------------------------------------------------------ */

// Widget untuk item kategori
class _CategoryItem extends StatelessWidget {
  final String image;
  final String title;
  const _CategoryItem({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: const Color(0xFFFFF8E1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: Image.asset(image, width: 32)),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

// Widget untuk judul bagian
class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}

// Widget daftar logo partner
class _PartnerList extends StatelessWidget {
  final List<String> logos;
  const _PartnerList(this.logos);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) => Image.asset(logos[i], width: 100),
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemCount: logos.length,
      ),
    );
  }
}

// Widget list horizontal untuk berita/tips
class _HorizontalList extends StatelessWidget {
  final List<NewsItem> items;
  const _HorizontalList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) {
          final n = items[i];
          return Container(
            width: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    n.image,
                    height: 90,
                    width: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  n.date,
                  style: const TextStyle(fontSize: 11, color: Colors.black45),
                ),
                const SizedBox(height: 2),
                Text(
                  n.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemCount: items.length,
      ),
    );
  }
}

// Model data sederhana untuk berita/tips
class NewsItem {
  final String image;
  final String title;
  final String date;
  NewsItem(this.image, this.title, this.date);
}

class ServiceCard extends StatelessWidget {
  final Service service;
  const ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  service.image,
                  width: 72,
                  height: 72,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Text(
                      service.subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          'Rp ${service.price.toInt()}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            elevation: 0,
                          ),
                          child: Text('Pesan', style: TextStyle(fontSize: 12)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* ---------------- Orders Page ---------------- */
class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // AppBar mimic
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Row(
              children: [
                BackButton(),
                SizedBox(width: 8),
                Text(
                  'Pesanan Saya',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(),

          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(16),
              itemBuilder: (context, i) {
                final o = orders[i];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    leading: CircleAvatar(child: Icon(Icons.design_services)),
                    title: Text(o.service),
                    subtitle: Text('${o.date} • ${o.id}'),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          o.status,
                          style: TextStyle(
                            color: o.status == 'Selesai'
                                ? Colors.green
                                : Colors.orange,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Rp ${o.price.toInt()}',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    onTap: () {
                      // show details
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('Detail Pesanan'),
                          content: Text(
                            'Service: ${o.service}\nTanggal: ${o.date}\nStatus: ${o.status}\nHarga: Rp ${o.price.toInt()}',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Tutup'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
              separatorBuilder: (_, __) => SizedBox(height: 12),
              itemCount: orders.length,
            ),
          ),
        ],
      ),
    );
  }
}

// HALAMAN BANTUAN 
class BantuanPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pusat Bantuan'),
        backgroundColor: const Color(0xFFFFEB3B),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Pertanyaan Umum',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _FaqItem(
            question: 'Bagaimana cara memesan tukang?',
            answer:
                'Pilih layanan yang kamu butuhkan di halaman Beranda, kemudian klik "Pesan" dan isi detail permintaanmu.',
          ),
          _FaqItem(
            question: 'Apakah harga sudah termasuk alat & bahan?',
            answer:
                'Harga jasa belum termasuk bahan, kecuali dinyatakan sebaliknya oleh tukang terkait.',
          ),
          _FaqItem(
            question: 'Bagaimana cara membatalkan pesanan?',
            answer:
                'Kamu bisa membatalkan pesanan melalui halaman "Pesanan" selama tukang belum dikonfirmasi.',
          ),
          const SizedBox(height: 24),
          const Text(
            'Hubungi Kami',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ListTile(
            leading: const Icon(Icons.message_outlined, color: Colors.green),
            title: const Text('WhatsApp Customer Service'),
            subtitle: const Text('+62 812-3456-7890'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.email_outlined, color: Colors.redAccent),
            title: const Text('Email Dukungan'),
            subtitle: const Text('support@tukang.com'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.access_time, color: Colors.blueGrey),
            title: const Text('Jam Operasional'),
            subtitle: const Text('Senin - Sabtu, 08.00 - 20.00 WIB'),
          ),
        ],
      ),
    );
  }
}

class _FaqItem extends StatefulWidget {
  final String question;
  final String answer;
  const _FaqItem({required this.question, required this.answer});

  @override
  State<_FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<_FaqItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ExpansionTile(
        title: Text(widget.question, style: const TextStyle(fontWeight: FontWeight.w500)),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(widget.answer, style: const TextStyle(color: Colors.black87)),
          )
        ],
        onExpansionChanged: (v) => setState(() => _expanded = v),
      ),
    );
  }
}

/* ---------------- Account Page ---------------- */
class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nasya Febrina',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'nasya@mail.com',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              ],
            ),
          ),
          Divider(),

          // account options
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.location_on_outlined),
                  title: Text('Alamat Saya'),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  leading: Icon(Icons.payment_outlined),
                  title: Text('Pembayaran'),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  leading: Icon(Icons.help_outline),
                  title: Text('Bantuan & Dukungan'),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Keluar'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
