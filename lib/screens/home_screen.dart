import 'package:flutter/material.dart';
import 'kelassaya_screen.dart';
import 'notifikasi_screen.dart';
import 'profile_screen.dart';

class LMSHomeScreen extends StatelessWidget {
  const LMSHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // --- BOTTOM NAVIGATION BAR ---
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 183, 62, 167),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            // Jika klik ikon ke-2 (Kelas Saya)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const KelasSayaScreen()),
            );
          } else if (index == 2) {
            // 2. Navigasi ke Notifikasi (Gunakan nama Kelas NotifikasiPage)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NotifikasiPage()),
            );
          }
        },
        // ---------------------------
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: "Kelas Saya",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifikasi",
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- HEADER SECTION ---
            Container(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
              color: const Color.fromARGB(255, 183, 62, 179),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hallo,",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "ILHAM WAHYUDI",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  _buildBadgeMahasiswa(context),
                ],
              ),
            ),

            // --- TUGAS MENDATANG ---
            _buildSectionHeader("Tugas Yang Akan Datang"),
            _buildTugasCard(),

            // --- PENGUMUMAN ---
            _buildSectionHeader("Pengumuman Terakhir", showSeeAll: true),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Maintenance Pra UAS Semester Genap 2025/2026",
                style: TextStyle(fontSize: 14),
              ),
            ),
            _buildBannerImage(),

            // --- PROGRES KELAS ---
            _buildSectionHeader("Progres Kelas"),
            _buildClassItem(
              "2021/2",
              "DESAIN ANTARMUKA & PENGALAMAN PENGGUNA",
              "D4SM-42-03 [ADY]",
              0.89,
            ),
            _buildClassItem(
              "2021/2",
              "KEWARGANEGARAAN",
              "D4SM-41-GAB1 [BBO]",
              0.86,
            ),
            _buildClassItem(
              "2021/2",
              "SISTEM OPERASI",
              "D4SM-44-02 [DDS]",
              0.90,
            ),
            _buildClassItem(
              "2021/2",
              "PEMROGRAMAN PERANGKAT BERGERAK",
              "D4SM-41-GAB1 [APJ]",
              0.90,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ================= HELPER WIDGET =================

  // --- PASTIKAN STRUKTURNYA PERSIS SEPERTI INI ---
  static Widget _buildBadgeMahasiswa(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 139, 30, 121),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: const [
            Text(
              "MAHASISWA",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    ); // <--- Ini penutup GestureDetector
  } // <--- Ini penutup fungsi _buildBadgeMahasiswa

  static Widget _buildSectionHeader(String title, {bool showSeeAll = false}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          if (showSeeAll)
            const Text(
              "Lihat Semua",
              style: TextStyle(color: Colors.blue, fontSize: 12),
            ),
        ],
      ),
    );
  }

  static Widget _buildTugasCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 175, 62, 183),
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        children: const [
          Text(
            "DESAIN ANTARMUKA & PENGALAMAN PENGGUNA",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Tugas 01 - UID Android Mobile Game",
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
          SizedBox(height: 20),
          Text(
            "Waktu Pengumpulan",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "tidak ada batas waktu dan tidak ada tekanan",
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
        ],
      ),
    );
  }

  static Widget _buildClassItem(
    String year,
    String title,
    String code,
    double progress,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.image, color: Colors.grey),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  year,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  maxLines: 2,
                ),
                Text(
                  code,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation(
                    Color.fromARGB(255, 183, 62, 157),
                  ),
                  minHeight: 8,
                ),
                Text(
                  "${(progress * 100).toInt()}% Selesai",
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildBannerImage() {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: NetworkImage('https://via.placeholder.com/400x150'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
