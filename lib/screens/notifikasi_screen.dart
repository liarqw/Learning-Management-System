import 'package:flutter/material.dart';
import 'pengumuman_screen.dart'; // Import agar bisa pindah halaman

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Notifikasi",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: const Color.fromARGB(255, 171, 62, 183),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: 8,
        separatorBuilder: (context, index) => const Divider(height: 1, indent: 70, endIndent: 20),
        itemBuilder: (context, index) {
          // --- PERBAIKAN DI SINI: Mengirimkan context dan index ---
          return _buildNotificationItem(context, index);
        },
      ),
    );
  }

  // --- PERBAIKAN DI SINI: Menambah BuildContext context di parameter ---
  Widget _buildNotificationItem(BuildContext context, int index) {
    bool isTask = index % 2 == 0;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      // Sekarang context sudah tersedia untuk Navigator
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PengumumanPage()),
        );
      },
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 173, 62, 183).withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          isTask ? Icons.description_outlined : Icons.quiz_outlined,
          color: const Color.fromARGB(255, 183, 62, 175),
          size: 28,
        ),
      ),
      title: Text(
        isTask
            ? "Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3"
            : "Kuis baru telah tersedia pada mata kuliah Pemrograman Perangkat Bergerak Multimedia",
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text("${index + 1} Hari Yang Lalu", style: const TextStyle(fontSize: 11)),
      ),
    );
  }
}