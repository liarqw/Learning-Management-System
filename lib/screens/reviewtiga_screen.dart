import 'package:flutter/material.dart';
// Pastikan file ini sudah ada di folder yang sama
import 'reviewempat_screen.dart';

class ReviewTigaScreen extends StatefulWidget {
  const ReviewTigaScreen({super.key});

  @override
  State<ReviewTigaScreen> createState() => _ReviewTigaScreenState();
}

class _ReviewTigaScreenState extends State<ReviewTigaScreen> {
  // Variabel untuk menyimpan pilihan jawaban
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
            // --- GRID NOMOR SOAL ---
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
                      // Menandai nomor 2 sebagai aktif (index 1)
                      color: index == 1
                          ? const Color(0xFFB73E3E)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(
                          color: index == 1 ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const Divider(height: 1),

            // --- AREA SOAL NOMOR 2 ---
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Soal Nomor 2  /  15",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 20),

                  _buildOption("A", "Intergrasi"),
                  _buildOption("B", "Standarisasi"),
                  _buildOption("C", "Konsistensi"),
                  _buildOption("D", "Koefensi"),
                  _buildOption("E", "Koreksi"),

                  const SizedBox(height: 30),

                  // --- TOMBOL NAVIGASI ---
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context); // Kembali ke nomor 1
                            },
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
                              // NAVIGASI KE REVIEW EMPAT
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ReviewEmpatScreen(),
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
