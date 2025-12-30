import 'package:flutter/material.dart';
// IMPORT WAJIB: Agar bisa berpindah ke halaman ringkasan percobaan
import 'reviewtiga_screen.dart';

class ReviewDuaScreen extends StatefulWidget {
  const ReviewDuaScreen({super.key});

  @override
  State<ReviewDuaScreen> createState() => _ReviewDuaScreenState();
}

class _ReviewDuaScreenState extends State<ReviewDuaScreen> {
  // Variabel untuk menyimpan jawaban yang dipilih
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
          // Tampilan Timer
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
                      // Tandai nomor 1 sebagai nomor aktif (warna merah)
                      color: index == 0
                          ? const Color(0xFFB73E3E)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(
                          color: index == 0 ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const Divider(height: 1),

            // --- AREA PERTANYAAN ---
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Soal Nomor 1  /  15",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Radio button dapat digunakan untuk menentukan ?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  // PILIHAN JAWABAN (A-E)
                  _buildOption("A", "Jenis Kelamin"),
                  _buildOption("B", "Alamat"),
                  _buildOption("C", "Hobby"),
                  _buildOption("D", "Riwayat Pendidikan"),
                  _buildOption("E", "Umur"),

                  const SizedBox(height: 40),

                  // --- TOMBOL SOAL SELANJUTNYA ---
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // NAVIGASI: Berpindah ke file reviewtiga_screen.dart
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ReviewTigaScreen(),
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
                        "Soal Selanjutnya",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget pendukung untuk membuat pilihan Radio Button
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
