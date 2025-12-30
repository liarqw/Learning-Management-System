import 'package:flutter/material.dart';
// 1. Import halaman settings agar bisa dipanggil
import 'settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Latar belakang abu muda
      appBar: AppBar(
        title: const Text(
          "Profil Saya",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFB73E3E), // Merah SEVIMA
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- BAGIAN ATAS: HEADER MERAH & FOTO PROFIL ---
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                // Background Merah
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFB73E3E),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                // Foto Profil (Overlap)
                Positioned(
                  top: 40,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundColor: Color(0xFFEEEEEE),
                      child: Icon(Icons.person, size: 80, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 70),

            // --- INFO MAHASISWA ---
            const Text(
              "ILHAM WAHYUDI",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "NPM: 2022020100053",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 30),

            // --- MENU LIST (MENGGUNAKAN CARD) ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // --- PERUBAHAN DI SINI: Navigasi ke SettingsScreen ---
                    _buildProfileMenu(
                      Icons.settings_outlined,
                      "Pengaturan Akun",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      },
                    ),
                    const Divider(height: 1, indent: 20, endIndent: 20),
                    _buildProfileMenu(
                      Icons.help_outline_rounded,
                      "Pusat Bantuan",
                      onTap: () {
                        // Aksi bantuan bisa ditambahkan di sini
                      },
                    ),
                    const Divider(height: 1, indent: 20, endIndent: 20),
                    _buildProfileMenu(
                      Icons.logout_rounded,
                      "Keluar dari Aplikasi",
                      color: Colors.red,
                      onTap: () {
                        // Kembali ke layar login
                        Navigator.of(
                          context,
                        ).popUntil((route) => route.isFirst);
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),
            Text(
              "LMS SEVIMA v1.0.2",
              style: TextStyle(color: Colors.grey[400], fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Helper untuk menu agar kode lebih rapi
  Widget _buildProfileMenu(
    IconData icon,
    String title, {
    Color color = Colors.black87,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
      onTap: onTap,
    );
  }
}
