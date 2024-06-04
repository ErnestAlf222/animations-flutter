import 'package:animations/config/theme/app_theme.dart';
import 'package:animations/pages/launcher_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeChanger(2),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).themeNow;

    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const Scaffold(
        body: LauncherPage(),
      ),
    );
  }
}
