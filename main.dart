import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MainApp(),
    title: "Question Games",
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Question Games"),
      ),
      body: Column(
        children: [
          Image.network(
              "https://images.squarespace-cdn.com/content/v1/663f738a89dc02694adb8670/ab586c91-6b0b-4791-aa5a-b60824f92094/OIIA-Website-loop.gif?format=1500w"),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TitleSection(),
          )
        ],
      ),
    );
  }
}

class TitleSection extends StatefulWidget {
  const TitleSection({super.key});

  @override
  State<TitleSection> createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection> {
  bool _isFavorited = false;
  int _favoriteCount = 999;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
      if (_isFavorited) {
        _favoriteCount++;
      } else {
        _favoriteCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "GIGI Question",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Created by GIGI")
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            _toggleFavorite();
          },
          icon: _isFavorited
              ? Icon(
                  Icons.thumb_up,
                  color: Colors.red,
                )
              : Icon(Icons.thumb_up_outlined), // เงื่อนไข ? if_true : if_false
        ),
        SizedBox(
          width: 20,
        ),
        Text("$_favoriteCount"), // เปลี่ยน int เป็น string
      ],
    );
  }
}
