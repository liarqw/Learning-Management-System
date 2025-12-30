import 'package:flutter/material.dart';

class PengumumanPage extends StatelessWidget {
  const PengumumanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Pengumuman",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 171, 62, 183),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Maintenance Pra UAS Semester Genap 2024/2025",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Diposkan pada: 3 hari yang lalu",
              style: TextStyle(color: Colors.grey[600]),
            ),
            const Divider(height: 30),
            const Text(
              "Informasi kepada seluruh mahasiswa bahwa akan dilakukan maintenance sistem pada tanggal 30 Juni untuk persiapan UAS. Mohon pastikan tugas Anda sudah terunggah sebelum waktu tersebut.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
