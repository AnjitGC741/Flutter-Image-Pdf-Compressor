import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http; // Import the http package

class ImageCompress extends StatefulWidget {
  const ImageCompress({Key? key}) : super(key: key);

  @override
  _ImageCompressState createState() => _ImageCompressState();
}

class _ImageCompressState extends State<ImageCompress> {
  File? _image;
  int? _selectedRadio = 1;

  Future<void> _getImageFromGallery() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _compressImage() async {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an image first.')),
      );
      return;
    }

    var uri = Uri.parse('https://localhost:7111/compress-img');
    var request = http.MultipartRequest('POST', uri);

    // Add image file to the request
    var imageField = await http.MultipartFile.fromPath('Files', _image!.path);
    request.files.add(imageField);

    // Add other form fields
    request.fields['ModuleName'] = 'YourModuleName';
    request.fields['Username'] = 'YourUsername';
    request.fields['Password'] = 'YourPassword';
    request.fields['AccessCode'] = 'YourAccessCode';
    request.fields['QualityLevel'] = _selectedRadio.toString();

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image compressed successfully.')),
        );
      } else {
        throw Exception('Failed to compress image.');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to send request.');
    }
  }


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
          children: [
            // Button Row
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: _getImageFromGallery,
                      child: Text('Select Image'),
                    ),
                  ),
                ),
              ],
            ),
            // Image Row
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 500.0,
                    width: 400.0,
                    alignment: Alignment.center,
                    child: _image == null
                        ? Text('No image selected')
                        : Image.file(_image!),
                  ),
                ),
              ],
            ),
            // Radio buttons Row
            Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: _selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadio = value;
                    });
                  },
                ),
                Text('High'),
                Radio(
                  value: 1,
                  groupValue: _selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadio = value;
                    });
                  },
                ),
                Text('Medium'),
                Radio(
                  value: 0,
                  groupValue: _selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadio = value;
                    });
                  },
                ),
                Text('Low'),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _compressImage,
        backgroundColor: primaryColor,
        child: Text('Compress Image'),
      ),
    );
  }
}
