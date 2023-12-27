import 'package:flutter/material.dart';

class ImageSearchScreen extends StatefulWidget {
  const ImageSearchScreen({super.key});

  @override
  State<ImageSearchScreen> createState() => _ImageSearchScreenState();
}

class _ImageSearchScreenState extends State<ImageSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextField(
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
