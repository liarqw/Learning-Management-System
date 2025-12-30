import 'package:flutter/material.dart';
// IMPORT WAJIB: Agar file ini mengenali halaman ReviewSatuScreen
import 'reviewsatu_screen.dart';

class QuizReviewScreen extends StatelessWidget {
  const QuizReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          "Tinjauan Kuis",
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
            // --- INFO HASIL KUIS ---
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: const Column(
                children: [
                  _InfoRow(
                    label: "Selesai pada",
                    value: "Kamis, 25 Februari 2021, 10:40",
                  ),
                  Divider(),
                  _InfoRow(
                    label: "Waktu yang digunakan",
                    value: "14 menit 20 detik",
                  ),
                  Divider(),
                  _InfoRow(label: "Tanda", value: "17,00/20,00"),
                  Divider(),
                  _InfoRow(label: "Nilai", value: "85,00 dari 100,00"),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // --- CONTOH TAMPILAN PERTANYAAN (DUMMY) ---
            const Text(
              "Tinjauan Jawaban",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            _buildQuestionCard(
              number: "1",
              question: "Apa kepanjangan dari UI?",
              answer: "User Interface",
              isCorrect: true,
            ),

            const SizedBox(height: 30),

            // --- TOMBOL AKSI ---
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  // NAVIGASI: Kembali ke halaman detail percobaan kuis
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReviewSatuScreen(),
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
                  "AMBIL KUIS KEMBALI",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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

  Widget _buildQuestionCard({
    required String number,
    required String question,
    required String answer,
    required bool isCorrect,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isCorrect ? Colors.green.shade200 : Colors.red.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pertanyaan $number",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            question,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Text(
            "Jawaban Anda: $answer",
            style: TextStyle(
              color: isCorrect ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
