import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TextApp(),
    );
  }
}

class TextApp extends StatelessWidget {
  TextApp({super.key});

  final myController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Retrieve text input"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: myController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Enter a search term"),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(myController.text),
                  );
                });
          }
        },
        tooltip: "Show me the value",
        child: Icon(Icons.star),
      ),
    );
  }
}
