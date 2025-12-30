import 'package:flutter/material.dart';

class PengantarScreen extends StatefulWidget {
  const PengantarScreen({super.key});

  @override
  State<PengantarScreen> createState() => _PengantarScreenState();
}

class _PengantarScreenState extends State<PengantarScreen> {
  int currentSlide = 1;
  final int totalSlides = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        title: const Text(
          "Materi Kuliah",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFB73E3E),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          // Header Judul Materi
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Pengantar Desain Antarmuka Pengguna",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Universitas Telkom • Slide $currentSlide/$totalSlides",
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),

          // Area Slide
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: _buildSlideContent(),
            ),
          ),

          // Navigasi Bawah
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: currentSlide > 1
                      ? () => setState(() => currentSlide--)
                      : null,
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  label: const Text(
                    "Sebelumnya",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB73E3E),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: currentSlide < totalSlides
                      ? () => setState(() => currentSlide++)
                      : null,
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                  label: const Text(
                    "Selanjutnya",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB73E3E),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlideContent() {
    switch (currentSlide) {
      case 1:
        return _slideJudul();
      case 2:
        return _slideProfilDosen();
      case 3:
        return _slideDefinisiUI();
      case 4:
        return _slidePentingnyaUI();
      default:
        return const SizedBox();
    }
  }

  // 1. Slide Judul
  Widget _slideJudul() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "UNIVERSITAS TELKOM",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        ),
        const SizedBox(height: 20),
        const Icon(Icons.phone_iphone, size: 80, color: Colors.pinkAccent),
        const SizedBox(height: 20),
        const Text(
          "Pengantar Desain Antarmuka Pengguna",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          "VSI2H4 - UI/UX Design",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }

  // 2. Slide Profil Dosen
  Widget _slideProfilDosen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "PROFIL DOSEN",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        const Divider(),
        const SizedBox(height: 10),
        const Center(
          child: CircleAvatar(radius: 40, child: Icon(Icons.person, size: 50)),
        ),
        const SizedBox(height: 15),
        const Text(
          "Nama: Ady Purna Kurniawan (ADY)",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const Text("Email: ady@telkomuniversity.ac.id"),
        const Text("WA: 0812-xxxx-xxxx"),
        const SizedBox(height: 20),
        const Text("Keahlian:", style: TextStyle(fontWeight: FontWeight.bold)),
        const Text(
          "• Sistem Informasi\n• Desain & Pemrograman Web\n• Pengembangan Game",
        ),
      ],
    );
  }

  // 3. Slide Definisi UI
  Widget _slideDefinisiUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "APA ITU USER INTERFACE?",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        const Divider(),
        const SizedBox(height: 10),
        const Text(
          "Bagian dari komputer/perangkat lunak yang bisa dilihat, didengar, disentuh, dan diajak bicara.",
          style: TextStyle(fontSize: 15),
        ),
        const SizedBox(height: 20),
        const Text(
          "UI yang Baik:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          "Bersifat 'Invisible' (tidak disadari), sehingga pengguna fokus pada tugasnya, bukan pada sistemnya.",
        ),
        const SizedBox(height: 20),
        const Text(
          "Komponen Utama: Input & Output",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // 4. Slide Pentingnya UI
  Widget _slidePentingnyaUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "MENGAPA UI ITU PENTING?",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        const Divider(),
        const SizedBox(height: 10),
        const Text(
          "• Sistem hebat bisa tak berguna jika UI-nya buruk (membingungkan).",
        ),
        const Text("• UI adalah jendela dan jembatan kemampuan software."),
        const SizedBox(height: 20),
        const Text(
          "Dampak UI Buruk:",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        ),
        const Center(
          child: Column(
            children: [
              Icon(
                Icons.sentiment_very_dissatisfied,
                size: 60,
                color: Colors.orange,
              ),
              Text(
                "MENYEBABKAN FRUSTRASI PADA PENGGUNA!",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
