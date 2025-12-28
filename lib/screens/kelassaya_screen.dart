import 'package:flutter/material.dart';

class KelasSayaScreen extends StatelessWidget {
  const KelasSayaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar di bagian atas
      appBar: AppBar(
        title: const Text(
          "Kelas Saya", 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
        ),
        backgroundColor: const Color.fromARGB(255, 155, 42, 165),
        iconTheme: const IconThemeData(color: Colors.white), // Agar tombol back warna putih
      ),
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Daftar Mata Kuliah",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            // Anda bisa menggunakan helper yang sama dengan home_screen untuk daftar kelas
            _buildClassItem("2021/2", "DESAIN ANTARMUKA & UX", "D4SM-42-03", 0.89),
            _buildClassItem("2021/2", "SISTEM OPERASI", "D4SM-44-02", 0.90),
            _buildClassItem("2021/2", "PEMROGRAMAN BERGERAK", "D4SM-41-GAB1", 0.75),
          ],
        ),
      ),
    );
  }

  // Widget Helper untuk item kelas agar tampilan konsisten
  Widget _buildClassItem(String year, String title, String code, double progress) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 60, height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.class_, color: Color.fromARGB(255, 159, 62, 183)),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(code, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 5),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation(Color.fromARGB(255, 181, 62, 183)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}