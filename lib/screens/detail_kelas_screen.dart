import 'package:flutter/material.dart';
import 'tugasdanquis_screen.dart';
import 'lampiranmateri_screen.dart';
import 'home_screen.dart';
import 'kelassaya_screen.dart';
import 'notifikasi_screen.dart';

class DetailKelasScreen extends StatelessWidget {
  const DetailKelasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          backgroundColor: const Color(0xFFB73E3E),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            "Detail Kelas",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.white70,
            labelColor: Colors.white,
            tabs: [
              Tab(text: "MATERI"),
              Tab(text: "TUGAS DAN KUIS"),
            ],
          ),
        ),
        body: TabBarView(
          children: [_buildMateriTab(context), const TugasDanKuisScreen()],
        ),
        // --- BOTTOM NAVIGATION BAR SESUAI DESKRIPSI ---
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color(0xFFB73E3E),
          unselectedItemColor: Colors.grey,
          currentIndex: 1, // Aktif di Kelas Saya
          onTap: (index) {
            if (index == 0)
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LMSHomeScreen()),
              );
            if (index == 1)
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const KelasSayaScreen(),
                ),
              );
            if (index == 2)
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const NotifikasiPage()),
              );
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: "Kelas Saya",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notifikasi",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMateriTab(BuildContext context) {
    return ListView(
      children: [
        // --- HEADER INFO MATA KULIAH ---
        Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Icon(Icons.people, size: 18, color: Colors.grey),
                  const SizedBox(width: 8),
                  const Text(
                    "31 Murid",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  const SizedBox(width: 20),
                  const Icon(
                    Icons.calendar_today,
                    size: 18,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      "Agenda Kelas Yang Akan Datang",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            "DAFTAR PERTEMUAN",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),

        // --- LIST PERTEMUAN SESUAI DESKRIPSI ---
        _buildPertemuanTile(
          context,
          "Pertemuan 1",
          "01 - Pengantar User Interface Design",
          "3 URLs, 2 Files, 3 Interactive Content",
        ),
        _buildPertemuanTile(
          context,
          "Pertemuan 2",
          "02 - Konsep User Interface Design",
          "2 URLs, 1 Kuis, 3 Files, 1 Tugas",
        ),
        _buildPertemuanTile(
          context,
          "Pertemuan 3",
          "03 - Interaksi pada User Interface Design",
          "3 URLs, 2 Files, 3 Interactive Content",
        ),
        _buildPertemuanTile(
          context,
          "Pertemuan 4",
          "04 - Ethnographic Observation",
          "3 URLs, 2 Files, 3 Interactive Content",
        ),
        _buildPertemuanTile(
          context,
          "Pertemuan 5",
          "05 - UID Testing",
          "3 URLs, 2 Files, 3 Interactive Content",
        ),
        _buildPertemuanTile(
          context,
          "Pertemuan 6",
          "06 - Assessment 1",
          "3 URLs, 2 Files, 3 Interactive Content",
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildPertemuanTile(
    BuildContext context,
    String title,
    String subtitle,
    String info,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ExpansionTile(
        leading: const CircleAvatar(
          backgroundColor: Color(0xFFFDEAEA),
          child: Icon(Icons.menu_book, color: Color(0xFFB73E3E), size: 20),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      size: 16,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        info,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LampiranMateriScreen(),
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
                      "BUKA MATERI",
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
    );
  }
}
