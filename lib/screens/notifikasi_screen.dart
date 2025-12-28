import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar dengan warna merah khas SEVIMA
      appBar: AppBar(
        title: const Text(
          "Notifikasi",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 171, 62, 183), // Merah SEVIMA
        centerTitle: true,
        elevation: 0,
        // Tombol kembali otomatis muncul jika dipanggil dengan Navigator.push
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: 8, // Jumlah notifikasi contoh
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          indent: 70, // Garis pemisah tidak memotong ikon
          endIndent: 20,
        ),
        itemBuilder: (context, index) {
          return _buildNotificationItem(index);
        },
      ),
    );
  }

  // Widget Helper untuk membangun item daftar notifikasi
  Widget _buildNotificationItem(int index) {
    // Simulasi perbedaan ikon antara tugas dan kuis
    bool isTask = index % 2 == 0;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
            ? "Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)"
            : "Kuis baru telah tersedia pada mata kuliah Pemrograman Perangkat Bergerak Multimedia",
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
          height: 1.4,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          "${index + 1} Hari Yang Lalu",
          style: TextStyle(fontSize: 11, color: Colors.grey[600]),
        ),
      ),
      onTap: () {
        // Logika ketika notifikasi diklik (opsional)
      },
    );
  }
}
