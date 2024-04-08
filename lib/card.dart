import 'package:flutter/material.dart';

void main() {
  runApp(CardApp());
}

class CardApp extends StatelessWidget {
  const CardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text(
            'Developer Card',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xFF00224D),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back), // Icon tombol kembali
            onPressed: () {
              Navigator.pop(context); // Kembali ke halaman sebelumnya (QuizApp)
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                _buildIDCard(
                  'Vanessa Aulia Syifa Yudiasmara',
                  'vanessa.22084@mhs.unesa.ac.id',
                  '22091397084',
                  'images/vanessa.jpeg',
                ),
                SizedBox(height: 20),
                _buildIDCard(
                  'Ananda Veda Basunjaya',
                  'ananda.22098@mhs.unesa.ac.id',
                  '22091397098',
                  'images/veda.jpeg',
                ),
                SizedBox(height: 20),
                _buildIDCard(
                  'Anis Putri Purwanti',
                  'anis.22099@mhs.unesa.ac.id',
                  '2209139799',
                  'images/anis.jpeg',
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIDCard(String name, String age, String idNumber, String imagePath) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.grey.shade200, Colors.white],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'ID: $idNumber',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00224D),
            ),
          ),
          SizedBox(height: 5),
          Text(
            age,
            style: TextStyle(
              fontSize: 16,
              color: Colors.blueGrey,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF00224D),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
            ),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Text(
                'D4 Manajemen Informatika',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}