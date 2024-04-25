import 'package:flutter/material.dart';

class PdfCompress extends StatelessWidget {
  const PdfCompress({super.key});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = const Color(0xFF8e2157);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Compressor',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          child: Text('Go to Home page'),
        ),
      ),
    );
  }
}
