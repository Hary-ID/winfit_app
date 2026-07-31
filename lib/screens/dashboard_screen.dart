import 'package:flutter/material.dart';
import 'barang_screen.dart';
import 'barang_masuk_screen.dart';
import 'barang_keluar_screen.dart';
import 'stok_opname_screen.dart';
import 'laporan_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "WINFIT STOCK",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        actions: const [
          Icon(Icons.notifications_none, color: Colors.white),
          SizedBox(width: 15),
          CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xFFFF4FA3),
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(width: 15),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          const Text(
            "Selamat Datang 👋",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Administrator",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),

          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF3B82F6),
                  Color(0xFFFF4FA3),
                ],
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(
                    Icons.inventory_2,
                    color: Colors.white,
                    size: 55,
                  ),

                  SizedBox(height: 15),

                  Text(
                    "WINFIT STOCK",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Sistem Manajemen Barang",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),

                ],
              ),
            ),
          ),

          const SizedBox(height: 30),
GridView.count(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  crossAxisCount: 2,
  mainAxisSpacing: 15,
  crossAxisSpacing: 15,
  childAspectRatio: 1.1,
  children: [

    menuCard(
      Icons.inventory_2,
      "Data Barang",
      const Color(0xFF3B82F6),
      () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const BarangScreen(),
    ),
  );
},
    ),

    menuCard(
      Icons.download,
      "Barang Masuk",
      Colors.green,
      () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const BarangMasukScreen(),
    ),
  );
},
    ),

    menuCard(
      Icons.upload,
      "Barang Keluar",
      Colors.red,
      () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const BarangKeluarScreen(),
    ),
  );
},
    ),

    menuCard(
      Icons.fact_check,
      "Stok Opname",
      Colors.orange,
      () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const StokOpnameScreen(),
    ),
  );
},
    ),

    menuCard(
      Icons.bar_chart,
      "Laporan",
      Colors.purple,
      () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const LaporanScreen(),
    ),
  );
},
    ),

    menuCard(
      Icons.settings,
      "Pengaturan",
      Colors.teal,
      () {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Menu Pengaturan masih dalam pengembangan"),
    ),
  );
},
    ),

  ],
),

const SizedBox(height: 30),

const Text(
  "Ringkasan Hari Ini",
  style: TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 15),

Container(
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: Colors.white12,
    borderRadius: BorderRadius.circular(20),
  ),
  child: const Column(
    children: [

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Barang Masuk",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "125",
            style: TextStyle(
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),

      SizedBox(height: 15),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Barang Keluar",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "82",
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),

      SizedBox(height: 15),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total Barang",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "1.250",
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),

    ],
  ),
),

const SizedBox(height: 30),

const Text(
  "Aktivitas Terakhir",
  style: TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 15),

Card(
  color: Colors.white10,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
  child: const Padding(
    padding: EdgeInsets.all(20),
    child: Column(
      children: [

        ListTile(
          leading: Icon(Icons.download, color: Colors.green),
          title: Text(
            "Barang Masuk",
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            "Hari ini",
            style: TextStyle(color: Colors.white70),
          ),
          trailing: Text(
            "+20",
            style: TextStyle(
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Divider(color: Colors.white24),

        ListTile(
          leading: Icon(Icons.upload, color: Colors.red),
          title: Text(
            "Barang Keluar",
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            "Hari ini",
            style: TextStyle(color: Colors.white70),
          ),
          trailing: Text(
            "-8",
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

      ],
    ),
  ),
),

const SizedBox(height: 30),

],
),

bottomNavigationBar: BottomNavigationBar(
  backgroundColor: const Color(0xFF111827),
  selectedItemColor: const Color(0xFFFF4FA3),
  unselectedItemColor: Colors.white60,
  type: BottomNavigationBarType.fixed,
  currentIndex: 0,
  items: const [

    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.inventory),
      label: "Barang",
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.bar_chart),
      label: "Laporan",
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Profil",
    ),

  ],
),
);
}

Widget menuCard(
  IconData icon,
  String title,
  Color color,
  VoidCallback onTap,
) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(20),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          CircleAvatar(
            radius: 28,
            backgroundColor: color,
            child: Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

        ],
      ),
    ),
  );
}

}
