import 'package:flutter/material.dart';
// IMPORT WAJIB: Agar file ini mengenali halaman pengerjaan kuis dan tinjauan
import 'reviewdua_screen.dart';
import 'Quizreveiw_screen.dart';

class ReviewSatuScreen extends StatelessWidget {
  const ReviewSatuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          "Kuis",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFB73E3E),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- JUDUL & DESKRIPSI ---
            const Text(
              "Quiz Review 1",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Text(
              "Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis. "
              "Jangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Kerjakan sebelum hari Jum'at, 26 Februari 2021 jam 23:59 WIB.\n"
              "Kuis Akan di tutup pada Jumat, 26 February 2021, 11:59 PM",
              style: TextStyle(
                fontSize: 13,
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 25),

            // --- INFO ATURAN KUIS ---
            _buildInfoRow("Batas Waktu", "15 menit"),
            _buildInfoRow("Metode Penilaian", "Nilai Tertinggi"),

            const SizedBox(height: 30),

            // --- TABEL PERCOBAAN ---
            const Text(
              "Percobaan Yang Sudah Di Lakukan",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildAttemptTable(context),

            const SizedBox(height: 20),

            // --- NILAI AKHIR ---
            Center(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: const Text(
                  "Nilai Akhir Anda Untuk Kuis Ini Adalah 85.0 / 100.00",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // --- TOMBOL AKSI ---
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // NAVIGASI: Ke halaman pengerjaan kuis (15 soal)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReviewDuaScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB73E3E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Ambil Kuis",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFB73E3E)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Kembali Ke Kelas",
                  style: TextStyle(
                    color: Color(0xFFB73E3E),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildAttemptTable(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Table(
        border: TableBorder.symmetric(
          inside: BorderSide(color: Colors.grey.shade300),
        ),
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(1.5),
          2: FlexColumnWidth(1),
        },
        children: [
          const TableRow(
            decoration: BoxDecoration(color: Color(0xFFF0F0F0)),
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Status",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Nilai / 100.00",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Tinjau Kembali",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Selesai\nDikirim Pada Kamis, 25 Februari 2021, 10:40",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "85,0",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextButton(
                  onPressed: () {
                    // NAVIGASI: Ke halaman tinjauan jawaban
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuizReviewScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Lihat",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
