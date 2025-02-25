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
            child: Row(
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
                Icon(Icons.thumb_up),
                SizedBox(
                  width: 20,
                ),
                Text("999"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
