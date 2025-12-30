import 'package:flutter/material.dart';
import 'dart:async';
import 'login_screen.dart';

class SevimaSplashScreen extends StatefulWidget {
  const SevimaSplashScreen({super.key});

  @override
  State<SevimaSplashScreen> createState() => _SevimaSplashScreenState();
}

class _SevimaSplashScreenState extends State<SevimaSplashScreen> {
  @override
  void initState() {
    super.initState();
    // Berpindah ke halaman login setelah 3 detik
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menggunakan background putih agar teks dan logo lebih menonjol
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ikon Topi Wisuda / Sekolah (Logo Dummy)
            const Icon(
              Icons.school_rounded,
              size: 100,
              color: Color(0xFFB73E3E), // Merah SEVIMA
            ),
            const SizedBox(height: 20),

            // Teks Utama
            const Text(
              "SEVIMA",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB73E3E),
                letterSpacing: 2,
              ),
            ),

            // Sub-teks sesuai deskripsi Anda
            const Text(
              "Learning Management System",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 50),

            // Loading Indicator di bagian bawah
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFB73E3E)),
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
