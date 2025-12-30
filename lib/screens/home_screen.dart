import 'package:flutter/material.dart';
import 'kelassaya_screen.dart';
import 'notifikasi_screen.dart';
import 'profile_screen.dart';
import 'detail_kelas_screen.dart';
// 1. IMPORT FILE TUGAS ANDA DI SINI
import 'desainantarmuka_screen.dart';

class LMSHomeScreen extends StatelessWidget {
  const LMSHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      // --- BOTTOM NAVIGATION BAR ---
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFB73E3E),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const KelasSayaScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NotifikasiPage()),
            );
          }
        },
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

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),

              // --- SECTION: TUGAS YANG AKAN DATANG ---
              _buildSectionTitle("Tugas Yang Akan Datang"),
              _buildUpcomingTasks(context), // 2. Tambahkan context di sini

              _buildSectionHeader("Pengumuman Terakhir", () {}),
              _buildAnnouncementCard(),

              _buildSectionTitle("Progres Kelas"),
              _buildClassProgressList(context),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "assalamualaikum,",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                "ilham wahyudi",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "MAHASISWA",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFFB73E3E),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            ),
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: Color(0xFFEEEEEE),
              child: Icon(Icons.person, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onSeeAll) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: onSeeAll,
            child: const Text(
              "Lihat Semua",
              style: TextStyle(color: Color(0xFFB73E3E)),
            ),
          ),
        ],
      ),
    );
  }

  // --- MODIFIKASI NAVIGASI TUGAS DI SINI ---
  Widget _buildUpcomingTasks(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20),
        children: [
          _buildTaskItem(
            context,
            "DESAIN ANTARMUKA & PENGALAMAN PENGGUNA",
            "Tugas 01 - UID Android Mobile Game",
            "Jumat 26 Februari, 23:59 WIB",
          ),
          _buildTaskItem(
            context,
            "SISTEM OPERASI D4SM-44-02 [DDS]",
            "02. [Tugas] Laporan Akhir Praktikum ke - 2",
            "Jumat 26 Februari, 23:59 WIB",
          ),
        ],
      ),
    );
  }

  Widget _buildTaskItem(
    BuildContext context,
    String course,
    String task,
    String deadline,
  ) {
    return GestureDetector(
      onTap: () {
        // 3. NAVIGASI LANGSUNG KE DESAIN ANTARMUKA SCREEN
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DesainAntarmukaScreen(),
          ),
        );
      },
      child: Container(
        width: 280,
        margin: const EdgeInsets.only(right: 15, bottom: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              course,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              task,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              maxLines: 2,
            ),
            const Spacer(),
            const Text(
              "Waktu Pengumpulan",
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
            Text(
              deadline,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnnouncementCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: const [
          Icon(Icons.campaign_outlined, color: Colors.orange, size: 30),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              "Maintenance Pra UAS Semester Genap 2020/2021",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClassProgressList(BuildContext context) {
    return Column(
      children: [
        _buildProgressItem(
          context,
          "2021/2",
          "DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]",
          0.89,
        ),
        _buildProgressItem(
          context,
          "2021/2",
          "KEWARGANEGARAAN D4SM-41-GAB1 [BBO]. JUMAT 2",
          0.86,
        ),
        _buildProgressItem(
          context,
          "2021/2",
          "SISTEM OPERASI D4SM-44-02 [DDS]",
          0.90,
        ),
      ],
    );
  }

  Widget _buildProgressItem(
    BuildContext context,
    String year,
    String title,
    double progress,
  ) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DetailKelasScreen()),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              year,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation(Color(0xFFB73E3E)),
              minHeight: 6,
            ),
            const SizedBox(height: 8),
            Text(
              "${(progress * 100).toInt()} % Selesai",
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
