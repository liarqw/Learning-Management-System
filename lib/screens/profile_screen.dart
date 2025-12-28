import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Saya", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 62, 183, 96),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          // Foto Profil
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, size: 80, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          // Informasi Pengguna
          const Text(
            "ilham wahyudi",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Text("NPM: 2022020100053", style: TextStyle(color: Colors.grey)),
          const Divider(height: 40, thickness: 1, indent: 20, endIndent: 20),
          
          // Daftar Menu Profil
          _buildProfileMenu(Icons.settings, "Pengaturan Akun"),
          _buildProfileMenu(Icons.help_outline, "Bantuan"),
          _buildProfileMenu(Icons.logout, "Keluar", color: const Color.fromARGB(255, 54, 73, 244)),
        ],
      ),
    );
  }

  Widget _buildProfileMenu(IconData icon, String title, {Color color = Colors.black}) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Tambahkan aksi di sini
      },
    );
  }
}