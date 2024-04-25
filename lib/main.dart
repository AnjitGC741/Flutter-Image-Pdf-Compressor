import 'package:flutter/material.dart';
import 'package:img_pdf_compressor/Pages/PdfCompress.dart';
import 'package:img_pdf_compressor/Pages/ImageCompress.dart';
import 'package:img_pdf_compressor/Pages/Home.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' :(context) => Home(),
      '/PdfCompress' : (context) => PdfCompress(),
      '/ImageCompress' : (context) => ImageCompress(),
    },

  ));
}

/*   child: Text('Compress Image'),
* Icon(Icons.photo_library)*/

