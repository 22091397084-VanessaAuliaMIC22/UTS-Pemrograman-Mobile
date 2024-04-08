import 'package:flutter/material.dart';
import 'quiz.dart'; // Import Quiz.dart
import 'card.dart'; // Import Card.dart

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome to HIMAFORTIC Quiz', // Ubah judul AppBar
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Ubah warna teks menjadi putih
          ),
        ),
        backgroundColor: Color(0xFF00224D), // Ubah warna latar belakang AppBar
        centerTitle: true, // Tengahkan judul AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0), // Memberikan padding di atas kontainer ikon dan teks
              child: Column(
                children: [
                  Icon(
                    Icons.quiz, // Icon untuk quiz
                    size: 72, // Ukuran ikon
                    color: Color(0xFF00224D), // Ubah warna ikon sesuai tema
                  ),
                  SizedBox(height: 10), // Jarak antara ikon dan teks
                  Text(
                    'HIMAFORTIC QUIZ', // Teks judul besar
                    style: TextStyle(
                      fontSize: 36, // Ukuran teks judul
                      fontWeight: FontWeight.bold, // Teks judul bold
                      color: Color(0xFF00224D), // Ubah warna teks sesuai tema
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Jarak antara judul besar dan judul
            Text(
              'Main Menu', // Teks judul kecil
              style: TextStyle(
                fontSize: 24, // Ukuran teks judul
                fontWeight: FontWeight.bold, // Teks judul bold
                color: Color(0xFF00224D), // Ubah warna teks sesuai tema
              ),
            ),
            SizedBox(height: 20), // Jarak antara judul dan tombol
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizApp()), // Pindah ke halaman Quiz
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF00224D)), // Atur warna latar belakang tombol
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Atur warna teks pada tombol
                minimumSize: MaterialStateProperty.all<Size>(Size(200, 60)), // Menetapkan lebar dan tinggi minimum tombol
              ),
              child: Text(
                'Take Quiz', // Teks tombol
                style: TextStyle(fontSize: 20), // Ganti ukuran teks
              ),
            ),
            SizedBox(height: 10), // Jarak antara tombol
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardApp()), // Pindah ke halaman Credit Card
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF00224D)), // Atur warna latar belakang tombol
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Atur warna teks pada tombol
                minimumSize: MaterialStateProperty.all<Size>(Size(200, 60)), // Menetapkan lebar dan tinggi minimum tombol
              ),
              child: Text(
                'Credit Card', // Teks tombol
                style: TextStyle(fontSize: 20), // Ganti ukuran teks
              ),
            ),
            SizedBox(height: 20), // Jarak antara tombol
          ],
        ),
      ),
    );
  }
}
