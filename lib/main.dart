import 'package:flutter/material.dart';
import 'mainmenu.dart'; // Import MainMenu.dart

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainMenu(), // Menetapkan MainMenu sebagai home
    );
  }
}
