import 'package:flutter/material.dart';

List<String> images = [
  "lib/EX-3/assets/bird.jpg",
  "lib/EX-3/assets/bird2.jpg",
  "lib/EX-3/assets/insect.jpg",
  "lib/EX-3/assets/girl.jpg",
  "lib/EX-3/assets/man.jpg",
];

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
    home: ImgGal(),
  ),
);

class ImgGal extends StatefulWidget {
  const ImgGal({super.key});

  @override
  State<ImgGal> createState() => _ImgGalState();
}

class _ImgGalState extends State<ImgGal> {
  int curImgIndex = 0;

  void nextImg() {
    setState(() {
      curImgIndex = (curImgIndex + 1) % images.length;
    });
  }

  void prevImg() {
    setState(() {
      curImgIndex = (curImgIndex - 1 + images.length) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: prevImg,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: nextImg,
            ),
          ),
        ],
      ),
      body: Image.asset(images[curImgIndex]),
    );
  }
}
