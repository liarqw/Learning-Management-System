import 'package:flutter/material.dart';
import 'detail_kelas_screen.dart';

class ReviewLimaScreen extends StatelessWidget {
  const ReviewLimaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          "Review Jawaban",
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
            // --- INFO RINGKASAN WAKTU & NILAI ---
            _buildSummaryCard(),
            const SizedBox(height: 25),

            // --- DAFTAR PERTANYAAN ---
            _buildReviewTile(
              "Pertanyaan 1",
              "Radio button dapat digunakan untuk menentukan ?",
              "A. Jenis Kelamin",
            ),
            _buildReviewTile(
              "Pertanyaan 2",
              "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman...",
              "B. Konsistensi",
            ),
            _buildReviewTile(
              "Pertanyaan 3",
              "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman...",
              "C. Konsistensi",
            ),
            _buildReviewTile(
              "Pertanyaan 4",
              "Radio button dapat digunakan untuk menentukan ?",
              "A. Jenis Kelamin",
            ),
            _buildReviewTile(
              "Pertanyaan 5",
              "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman...",
              "C. Konsistensi",
            ),
            _buildReviewTile(
              "Pertanyaan 6",
              "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman...",
              "C. Konsistensi",
            ),
            _buildReviewTile(
              "Pertanyaan 7",
              "Radio button dapat digunakan untuk menentukan ?",
              "A. Jenis Kelamin",
            ),

            const SizedBox(height: 30),

            // --- TOMBOL KIRIM JAWABAN ---
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  _showFinalSubmitDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB73E3E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Kirim Jawaban",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: const Column(
        children: [
          _SummaryRow(
            label: "Di Mulai Pada",
            value: "Kamis 25 Februari 2021 10:25",
          ),
          Divider(),
          _SummaryRow(label: "Status", value: "Selesai"),
          Divider(),
          _SummaryRow(
            label: "Selesai Pada",
            value: "Kamis 25 Februari 2021 10:40",
          ),
          Divider(),
          _SummaryRow(label: "Waktu Penyelesaian", value: "13 Menit 22 Detik"),
          Divider(),
          _SummaryRow(label: "Nilai", value: "0 / 100", isBold: true),
        ],
      ),
    );
  }

  Widget _buildReviewTile(String title, String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const Text(
                "Jawaban Tersimpan",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            question,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Text(
            "Jawaban: $answer",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Lihat Soal",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFinalSubmitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Konfirmasi Akhir"),
        content: const Text(
          "Kirim semua jawaban sekarang? Anda tidak dapat mengubah jawaban setelah ini.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailKelasScreen(),
                ),
                (route) => false,
              );
            },
            child: const Text(
              "Kirim",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
