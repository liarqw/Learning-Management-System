import 'package:flutter/material.dart';
import 'aploatfile_screen.dart';

class DesainAntarmukaScreen extends StatelessWidget {
  const DesainAntarmukaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          "Detail Tugas",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFB73E3E),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- HEADER JUDUL ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: const Text(
                "Tugas 01 - UID Android Mobile Game",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // --- DESKRIPSI TUGAS ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              color: Colors.white,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1. Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS (First Person Shooter) yang akan menjadi tugas pada mata kuliah Pemrograman Aplikasi Permainan.\n\n"
                    "2. Desain yang dibuat harus melingkupi seluruh tampilan pada aplikasi/game, dari pertama kali aplikasi dibuka sampai ditutup kembali, serta desain untuk tampilan-tampilan fungsi yang mendukung permainan seperti pop-up, alert, chat, dan lain-lain.\n\n"
                    "3. Desain bisa dibuat menggunakan aplikasi khusus desain atau secara manual dengan tetap menjunjung kerapihan dan kejelasan setiap elemen dalam desain.\n\n"
                    "4. Berikan identitas aplikasi game yang dibuat, seperti Nama Game, Genre, dan Platform. Serta berikan penjelasan pada setiap elemen pada desain, seperti gambar, teks, tombol, icon, dan lain-lain.\n\n"
                    "5. File dikumpulkan dalam format .PDF dengan size maksimal 5MB.\n\n"
                    "6. Tugas dikumpulkan paling lambat hari Jum'at, 26 Februari 2021 jam 23:59 WIB (akan tertutup otomatis) dan akan dipresentasikan pada pertemuan selanjutnya via Zoom Meeting.",
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // --- STATUS TUGAS ---
            _buildSectionHeader("STATUS TUGAS"),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  _buildStatusRow(
                    "Status",
                    "Sudah Mengirim untuk di nilai",
                    Colors.green,
                  ),
                  const Divider(),
                  _buildStatusRow(
                    "Status Nilai",
                    "Belum Di nilai",
                    Colors.orange,
                  ),
                  const Divider(),
                  _buildStatusRow(
                    "Batas tanggal",
                    "Jumat, 26 Feb 2021, 23:59 WIB",
                    Colors.black87,
                  ),
                  const Divider(),
                  _buildStatusRow(
                    "Sisa Waktu",
                    "Tugas sudah di kirim 4 Hari 6 Jam Sebelum nya",
                    Colors.green,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // --- FILE TUGAS ---
            _buildSectionHeader("FILE TUGAS"),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.picture_as_pdf,
                  color: Colors.red,
                  size: 30,
                ),
                title: const Text(
                  "Dandy Candra Pratama_7708170114.pdf",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text("1.2 MB", style: TextStyle(fontSize: 11)),
                onTap: () {
                  // Aksi buka PDF
                },
              ),
            ),

            const SizedBox(height: 25),

            // --- TOMBOL TAMBAHKAN TUGAS ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UploadFileScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB73E3E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "TAMBAHKAN TUGAS",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildStatusRow(String label, String value, Color valueColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: valueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
