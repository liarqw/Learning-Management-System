import 'package:flutter/material.dart';
import 'detail_kelas_screen.dart';
import 'home_screen.dart';
import 'notifikasi_screen.dart';

class KelasSayaScreen extends StatelessWidget {
  const KelasSayaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      // --- APPBAR ---
      appBar: AppBar(
        title: const Text(
          "Kelas Saya",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFB73E3E), // Merah SEVIMA
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading:
            false, // Menghilangkan tombol back karena ada BottomNav
      ),

      // --- DAFTAR KELAS ---
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
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
          _buildProgressItem(
            context,
            "2021/2",
            "PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA D4SM-41-GAB1 [APJ]",
            0.90,
          ),
          _buildProgressItem(
            context,
            "2021/2",
            "BAHASA INGGRIS: BUSINESS AND SCIENTIFIC D4SM-41-GAB1 [ARS]",
            0.90,
          ),
          _buildProgressItem(
            context,
            "2021/2",
            "PEMROGRAMAN MULTIMEDIA INTERAKTIF D4SM-43-04 [TPR]",
            0.90,
          ),
          _buildProgressItem(
            context,
            "2021/2",
            "OLAH RAGA D3TT-44-02 [EYR]",
            0.90,
          ),
          const SizedBox(height: 20),
        ],
      ),

      // --- BOTTOM NAVIGATION BAR ---
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFB73E3E),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        currentIndex: 1, // Aktif di "Kelas Saya"
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LMSHomeScreen()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
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
    );
  }

  // Widget untuk setiap item mata kuliah
  Widget _buildProgressItem(
    BuildContext context,
    String year,
    String title,
    double progress,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailKelasScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              year,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black87,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 15),
            // Progress Bar
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation(Color(0xFFB73E3E)),
                minHeight: 8,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "${(progress * 100).toInt()} % Selesai",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
