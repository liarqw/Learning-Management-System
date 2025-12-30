import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF8F9FA,
      ), // Latar belakang abu sangat muda
      appBar: AppBar(
        title: const Text(
          "Pengaturan Profil",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFB73E3E), // Merah SEVIMA
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("AKUN"),
            _buildSettingsCard([
              _buildSettingsItem(
                Icons.person_outline,
                "Informasi Pribadi",
                "Nama, NPM, Email",
              ),
              _buildSettingsItem(
                Icons.lock_outline,
                "Ubah Kata Sandi",
                "Amankan akun Anda",
              ),
            ]),

            _buildSectionTitle("NOTIFIKASI"),
            _buildSettingsCard([
              _buildSettingsItem(
                Icons.notifications_none,
                "Pengaturan Notifikasi",
                "Atur pemberitahuan tugas",
              ),
            ]),

            _buildSectionTitle("LAINNYA"),
            _buildSettingsCard([
              _buildSettingsItem(
                Icons.info_outline,
                "Tentang Aplikasi",
                "Versi 1.0.2",
              ),
              _buildSettingsItem(
                Icons.privacy_tip_outlined,
                "Kebijakan Privasi",
                null,
              ),
            ]),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Widget untuk judul setiap bagian (Section)
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 13,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }

  // Widget untuk membungkus grup menu dalam kotak putih (Card)
  Widget _buildSettingsCard(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  // Widget untuk setiap baris menu pengaturan
  Widget _buildSettingsItem(IconData icon, String title, String? subtitle) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFB73E3E).withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: const Color(0xFFB73E3E), size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          color: Colors.black87,
        ),
      ),
      subtitle: subtitle != null
          ? Text(subtitle, style: const TextStyle(fontSize: 12))
          : null,
      trailing: const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
      onTap: () {
        // Tambahkan fungsi klik di sini jika diperlukan
      },
    );
  }
}
