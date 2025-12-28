import 'dart:async';
import 'package:flutter/material.dart';
// 1. Tambahkan import halaman login Anda
import 'login_screen.dart'; 

class SevimaSplashScreen extends StatefulWidget {
  @override
  _SevimaSplashScreenState createState() => _SevimaSplashScreenState();
}

class _SevimaSplashScreenState extends State<SevimaSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      // 2. Ubah SevimaSplashScreen() menjadi LoginPage()
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }
  
  // ... sisa kode build tetap sama ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          // Menggunakan gradasi warna merah agar identik dengan tema login
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFD32F2F), // Merah Terang
              Color(0xFFB71C1C), // Merah Gelap (Warna Utama)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Icon Putih dengan bayangan halus
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 20, offset: Offset(0, 10))
                ],
              ),
              child: Icon(Icons.school_rounded, size: 100, color: Colors.white),
            ),
            SizedBox(height: 24),
            Text(
              "SEVIMA",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w900,
                letterSpacing: 6,
              ),
            ),
            Text(
              "IT FOR EDUCATION",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
                letterSpacing: 3,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 80),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2,
            ),
          ],
        ),
      ),
    );
  }
}