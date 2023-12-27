import 'package:flutter/material.dart';

class ImageSearchScreen extends StatefulWidget {
  const ImageSearchScreen({super.key});

  @override
  State<ImageSearchScreen> createState() => _ImageSearchScreenState();
}

class _ImageSearchScreenState extends State<ImageSearchScreen> {
  final List<String> stringList = ['111', '222'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      width: 2,
                      color: Color(0xFF4FB6B2),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      width: 2,
                      color: Color(0xFF4FB6B2),
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Color(0xFF4FB6B2),
                  ),
                  hintText: 'Search',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 100, // 총 아이템 수
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.purple,
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 열
                    crossAxisSpacing: 10, // 열 공백
                    mainAxisSpacing: 10, // 행 공백
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
