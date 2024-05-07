import 'package:animations/config/theme/app_theme.dart';
import 'package:animations/pages/emergency_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme(),
      home: const Scaffold(
        body:EmergencyPage(),
      ),
    );
  }
}
