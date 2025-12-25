import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: LMSHomeScreen(),
      debugShowCheckedModeBanner: false,
    ));

class LMSHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // --- BOTTOM NAVIGATION BAR ---
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFB73E3E),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Kelas Saya"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifikasi"),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- HEADER SECTION ---
            Container(
              padding: EdgeInsets.fromLTRB(20, 60, 20, 30),
              color: Color(0xFFB73E3E),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hallo,", style: TextStyle(color: Colors.white, fontSize: 16)),
                      Text("ILHAM WAHYUDI", 
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                  _buildBadgeMahasiswa(),
                ],
              ),
            ),

            // --- TUGAS MENDATANG ---
            _buildSectionHeader("Tugas Yang Akan Datang"),
            _buildTugasCard(),

            // --- PENGUMUMAN ---
            _buildSectionHeader("Pengumuman Terakhir", showSeeAll: true),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Maintenance Pra UAS Semester Genap 2020/2021", style: TextStyle(fontSize: 14)),
            ),
            _buildBannerImage(),

            // --- PROGRES KELAS ---
            _buildSectionHeader("Progres Kelas"),
            _buildClassItem("2021/2", "DESAIN ANTARMUKA & PENGALAMAN PENGGUNA", "D4SM-42-03 [ADY]", 0.89),
            _buildClassItem("2021/2", "KEWARGANEGARAAN", "D4SM-41-GAB1 [BBO]", 0.86),
            _buildClassItem("2021/2", "SISTEM OPERASI", "D4SM-44-02 [DDS]", 0.90),
            _buildClassItem("2021/2", "PEMROGRAMAN PERANGKAT BERGERAK", "D4SM-41-GAB1 [APJ]", 0.90),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget Helper: Badge Mahasiswa
  Widget _buildBadgeMahasiswa() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xFF8B1E1E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text("MAHASISWA", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
          SizedBox(width: 8),
          CircleAvatar(radius: 12, backgroundColor: Colors.white, child: Icon(Icons.person, size: 18, color: Colors.grey)),
        ],
      ),
    );
  }

  // Widget Helper: Header Section
  Widget _buildSectionHeader(String title, {bool showSeeAll = false}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 25, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          if (showSeeAll) Text("Lihat Semua", style: TextStyle(color: Colors.blue, fontSize: 12)),
        ],
      ),
    );
  }

  // Widget Helper: Kartu Tugas
  Widget _buildTugasCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFFB73E3E),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))],
      ),
      child: Column(
        children: [
          Text("DESAIN ANTARMUKA & PENGALAMAN PENGGUNA",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 10),
          Text("Tugas 01 - UID Android Mobile Game", style: TextStyle(color: Colors.white70, fontSize: 13)),
          SizedBox(height: 20),
          Text("Waktu Pengumpulan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Text("Jumat 26 Februari, 23:59 WIB", style: TextStyle(color: Colors.white, fontSize: 13)),
        ],
      ),
    );
  }

  // Widget Helper: Item Daftar Kelas
  Widget _buildClassItem(String year, String title, String code, double progress) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80, height: 80,
            decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
            child: Icon(Icons.image, color: Colors.grey), // Placeholder untuk icon UI/UX atau bendera
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(year, style: TextStyle(fontSize: 10, color: Colors.grey)),
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13), maxLines: 2),
                Text(code, style: TextStyle(fontSize: 12, color: Colors.black54)),
                SizedBox(height: 10),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFB73E3E)),
                  minHeight: 8,
                ),
                Text("${(progress * 100).toInt()}% Selesai", style: TextStyle(fontSize: 10)),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Widget Helper: Banner Gambar
  Widget _buildBannerImage() {
    return Container(
      margin: EdgeInsets.all(20),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage('https://via.placeholder.com/400x150'), // Ganti dengan aset Maintenance LMS
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}