import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: FavPage(),
  ),
);

class FavPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
         FavCard(),
         FavCard(),
         FavCard(),
        ],
      ),
    );
  }
}

class FavCard extends StatefulWidget {
  const FavCard({super.key});

  @override
  State<FavCard> createState() => _FavCardState();
}

class _FavCardState extends State<FavCard> {
  bool isFav = false;

  void setFav() {
    setState(() {
      isFav = !isFav;
    });
  }

  Color get iconColor {
    return isFav ? Colors.red : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("Title"), Text("Description")],
            ),
          ),

          IconButton(
            onPressed: setFav,
            icon: Icon(Icons.favorite, color: iconColor),
          ),
        ],
      ),
    );
  }
}
