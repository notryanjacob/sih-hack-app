import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 170, 99),
        title: const Text(
          'Diagnose Disease',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.image,
              color: Colors.white,
            ),
            onPressed: _pickImage,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              // child: _selectedImage == null
              //     ? Text('No image selected.')
              //     : Image.file(File(_selectedImage!.path)),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey,
                      width: 1), // Set border color and width
                  borderRadius: BorderRadius.circular(10), // Set border radius
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Upload Image'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Handle the send button action
                    print('Message sent: ${_controller.text}');
                    _controller.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
