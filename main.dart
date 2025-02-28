import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Three words app"),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                _navigateAndDisplaySelection(context);
              },
              child: Text("Give me three words!")),
        ));
  }

  Future _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EnterText(),
        ));
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("$result")));
  }
}

class EnterText extends StatelessWidget {
  const EnterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter your text"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          onFieldSubmitted: (value) {
            Navigator.pop(context, value);
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: "Type something..."),
        ),
      ),
    );
  }
}
