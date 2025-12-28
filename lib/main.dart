import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; 
// Hapus import home_screen di sini karena alurnya lewat Splash -> Login -> Home

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SEVIMA LMS',
      debugShowCheckedModeBanner: false,
      home: SevimaSplashScreen(), // Mulai dari Splash Screen
    );
  }
}