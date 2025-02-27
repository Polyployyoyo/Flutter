import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Main Screen"),
        ),
        body: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MySecondScreen()));
          },
          child: Hero(
            tag: "catmeme",
            child: Image.network(
                "https://cdn-useast1.kapwing.com/static/templates/crying-cat-meme-template-regular-096fc808.webp"),
          ),
        ));
  }
}

class MySecondScreen extends StatelessWidget {
  const MySecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Hero(
            tag: "catmeme",
            child: Image.network(
                "https://www.worldsbestcatlitter.com/wp-content/uploads/2019/12/02_coughing-cat-meme.jpg"),
          ),
        ),
      ),
    );
  }
}
