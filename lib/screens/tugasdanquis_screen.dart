import 'package:flutter/material.dart';
import 'Quizreveiw_screen.dart';
import 'desainantarmuka_screen.dart';

class TugasDanKuisScreen extends StatelessWidget {
  const TugasDanKuisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: ListView(
        children: [
          // --- HEADER INFO KELAS ---
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    _buildStatItem(Icons.people, "31 Murid"),
                    const SizedBox(width: 20),
                    _buildStatItem(
                      Icons.calendar_today,
                      "Agenda Kelas Yang Akan Datang",
                    ),
                  ],
                ),
              ],
            ),
          ),

          // --- SECTION QUIZ ---
          _buildSectionHeader("QUIZ"),
          _buildTaskTile(
            context,
            title: "Quiz Review 01",
            subtitle: "Tenggat Waktu : 26 Februari 2021 23:59 WIB",
            icon: Icons.quiz_outlined,
            iconColor: Colors.orange,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QuizReviewScreen(),
                ),
              );
            },
          ),

          // --- SECTION TUGAS ---
          _buildSectionHeader("Tugas"),
          _buildTaskTile(
            context,
            title: "Tugas 01 - UID Android Mobile Game",
            subtitle: "Tenggat Waktu : 26 Februari 2021 23:59 WIB",
            icon: Icons.assignment_outlined,
            iconColor: Colors.blue,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DesainAntarmukaScreen(),
                ),
              );
            },
          ),

          // --- SECTION PERTEMUAN 3 ---
          _buildSectionHeader("Pertemuan 3"),
          _buildTaskTile(
            context,
            title: "Kuis - Assessment 2",
            subtitle: "Tenggat Waktu : 26 Februari 2021 23:59 WIB",
            icon: Icons.timer_outlined,
            iconColor: Colors.red,
            onTap: () {
              // Tambahkan navigasi kuis lain di sini jika ada
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Widget Helper untuk Label Section (QUIZ, Tugas, dll)
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  // Widget Helper untuk Statistik Murid
  Widget _buildStatItem(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 5),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  // Widget Helper untuk Item List Tugas/Kuis
  Widget _buildTaskTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      ),
    );
  }
}
