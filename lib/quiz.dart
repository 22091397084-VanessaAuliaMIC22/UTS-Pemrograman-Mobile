import 'package:flutter/material.dart';
import 'mainmenu.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black26,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ).copyWith(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent), // Atur warna latar belakang tombol
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(),
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  int _score = 0;

  void _answerQuestion(String answer) {
    setState(() {
      if (_questionIndex < _questions.length - 1) {
        if (_correctAnswers[_questionIndex] == answer) {
          _score += 10;
        }
        _questionIndex++;
      } else {
        if (_correctAnswers[_questionIndex] == answer) {
          _score += 10;
        }
        _showResultDialog();
      }
    });
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz Selesai'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Skor Anda: $_score / 100', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Text(
                'Jawaban yang benar adalah: ${_correctAnswers.join(", ")}',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _questionIndex = 0;
                  _score = 0;
                });
              },
              child: Text('Kembali', style: TextStyle(color: Colors.white)), // Ubah warna teks
            ),
          ],
        );
      },
    );
  }

  final List<Map<String, Object>> _questions = const [
    {
      'questionText': '"Equillibre" diambil dari bahasa?',
      'answers': ['Prancis', 'Indonesia', 'India', 'Rusia'],
    },
    {
      'questionText': 'Apa arti/makna Equillibre?',
      'answers': [
        'Kemakmuran',
        'Kenakalan',
        'Keseimbangan',
        'Komunisme'
      ],
    },
    {
      'questionText': 'Dibawah ini merupakan indikator keberhasilan pengangkatan Kecuali?',
      'answers': ['Kekeluargaan', '5S', 'Sabar', 'Cinta Jurusan'],
    },
    {
      'questionText': 'Apa warna identik dengan prodi manajemen informatika?',
      'answers': [
        'Oranye',
        'Biru',
        'Hitam',
        'Hijau'
      ],
    },
    {
      'questionText': 'Dibawah ini yang termasuk konbel adalah?',
      'answers': [
        'Dasi Hitam',
        'Sepatu Pantofel',
        'Topi MI',
        'Sepatu Hitam'
      ],
    },
    {
      'questionText': 'Di bawah ini yang merupakan 5S kecuali ?',
      'answers': [
        'Senyum',
        'Sapa',
        'Sopan',
        'Sabar'
      ],
    },
    {
      'questionText': 'Apa julukan dari ketua angkatan di MI?',
      'answers': ['Kuro', 'Kahima', 'Komdis', 'Komting'],
    },
    {
      'questionText':
      'Dibawah ini merupakan keluarga besar informatika, kecuali ...',
      'answers': [
        'Teknik Informatika',
        'Sistem Informasi',
        'Manajemen Informatika',
        'Teknik Mesin'
      ],
    },
    {
      'questionText': 'Panggilan yang pantas untuk memanggil kakak tingkat, kecuali ...',
      'answers': [
        'Kak',
        'Woi',
        'Mas',
        'Mbak'
      ],
    },
    {
      'questionText':
      'Apa jargon Manajemen Informatika?',
      'answers': [
        'Himafortic',
        'Himafortic Traiasca',
        'Traiasca Himafortic',
        'Traiasca'
      ],
    },
  ];

  final List<String> _correctAnswers = [
    'Prancis',
    'Keseimbangan',
    'Sabar',
    'Oranye',
    'Sepatu Pantofel',
    'Sabar',
    'Kuro',
    'Teknik Mesin',
    'Woi',
    'Traiasca Himafortic',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz', style: TextStyle(color: Colors.white)), // Ubah warna teks
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Ubah warna icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.lightBlue], // Ubah warna gradient sesuai keinginan
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  _questions[_questionIndex]['questionText'] as String,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ...(_questions[_questionIndex]['answers'] as List<String>)
                  .map((answer) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ElevatedButton(
                    onPressed: () => _answerQuestion(answer),
                    child: Text(
                      answer,
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent, // Ubah warna latar belakang tombol menjadi transparan
                      elevation: 0, // Hapus elevasi tombol
                      side: BorderSide(color: Colors.white), // Tambahkan garis pinggir putih
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // Ubah bentuk tombol
                      ),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
