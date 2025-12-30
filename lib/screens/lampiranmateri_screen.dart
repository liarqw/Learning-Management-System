import 'package:flutter/material.dart';
import 'pengantar_screen.dart'; // Import agar bisa pindah ke halaman materi 1/26

class LampiranMateriScreen extends StatelessWidget {
  const LampiranMateriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          title: const Text(
            "Materi Kuliah",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xFFB73E3E),
          iconTheme: const IconThemeData(color: Colors.white),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Lampiran Materi"),
              Tab(text: "Tugas dan Kuis"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildLampiranContent(context),
            const Center(child: Text("Halaman Tugas dan Kuis")),
          ],
        ),
      ),
    );
  }

  Widget _buildLampiranContent(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children: [
        _buildMateriItem(
          context,
          title: "Pengantar User Interface Design",
          subtitle: "PDF Materi Utama",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PengantarScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildMateriItem(
    BuildContext context, {
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
