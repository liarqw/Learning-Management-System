import 'package:flutter/material.dart';
// IMPORT WAJIB: Agar terhubung ke halaman review jawaban (Review Lima)
import 'reviewlima_screen.dart';

class ReviewEmpatScreen extends StatefulWidget {
  const ReviewEmpatScreen({super.key});

  @override
  State<ReviewEmpatScreen> createState() => _ReviewEmpatScreenState();
}

class _ReviewEmpatScreenState extends State<ReviewEmpatScreen> {
  String? _selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          "Quiz Review 1",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFB73E3E),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            alignment: Alignment.center,
            child: const Text(
              "15 : 00",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- NAVIGASI NOMOR SOAL (GRID 1-15) ---
            Container(
              padding: const EdgeInsets.all(15),
              color: Colors.white,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      // Tandai nomor 3 sebagai nomor aktif (warna merah)
                      color: index == 2
                          ? const Color(0xFFB73E3E)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(
                          color: index == 2 ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const Divider(height: 1),

            // --- AREA PERTANYAAN NOMOR 3 ---
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Soal Nomor 3  /  15",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  // PILIHAN JAWABAN
                  _buildOption("C", "Hobby"),
                  _buildOption("B", "Alamat"),
                  _buildOption("A", "Jenis Kelamin"),
                  _buildOption("D", "Riwayat Pendidikan"),
                  _buildOption("E", "Umur"),

                  const SizedBox(height: 30),

                  // --- TOMBOL NAVIGASI ---
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
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
                              "Soal Sebelumnya",
                              style: TextStyle(
                                color: Color(0xFFB73E3E),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Memanggil fungsi dialog konfirmasi
                              _showFinishDialog(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB73E3E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              "Selesai.",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi Dialog Konfirmasi Selesai
  void _showFinishDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (innerContext) => AlertDialog(
        title: const Text("Kumpulkan Kuis?"),
        content: const Text(
          "Apakah Anda yakin telah menjawab semua soal dan ingin melihat ringkasan jawaban?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(innerContext),
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(innerContext); // Tutup dialog
              // NAVIGASI: Berpindah ke file reviewlima_screen.dart
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReviewLimaScreen(),
                ),
              );
            },
            child: const Text(
              "Ya, Selesai",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(String code, String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: RadioListTile<String>(
        title: Text("$code.  $text"),
        value: code,
        groupValue: _selectedAnswer,
        activeColor: const Color(0xFFB73E3E),
        onChanged: (value) {
          setState(() {
            _selectedAnswer = value;
          });
        },
      ),
    );
  }
}
