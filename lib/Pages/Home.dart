import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({super.key});

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose What You Like To Compress',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/PdfCompress');
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(180, 50)), // Set width and height
                backgroundColor: MaterialStateProperty.all(Colors.white), // Set background color
                side: MaterialStateProperty.all(BorderSide(
                  color: primaryColor,
                  width: 2,
                )), // Set border
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Set border radius
                  ),
                ), // Set border radius
              ),
              child: Text(
                'Compress Pdf',
                style: TextStyle(color: primaryColor), // Set text color
              ),
            ),
            SizedBox(height: 16), // Add some space between the buttons
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ImageCompress');
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(180, 50)), // Set width and height
                backgroundColor: MaterialStateProperty.all(primaryColor), // Set background color
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Set border radius
                  ),
                ), // Set border radius
              ),
              child: Text(
                'Compress Image',
                style: TextStyle(color: Colors.white), // Set text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
