import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

//! ฟังชั่นเช็ค std id
  dynamic checkID(String? value) {
    final idRegex = RegExp(r"^[0-9]");
    if (value == null || value.isEmpty) {
      return "Please type your std id";
    } else if (!idRegex.hasMatch(value)) {
      return "Please type only number";
    } else if (value.length != 10) {
      return "Please type 10 number (Your text length is ${value.length})";
    }
    return null;
  }

//! ฟังชั่นเช็ค Email
  dynamic checkEmail(String? value) {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value == null || value.isEmpty) {
      return "Please type your email";
    } else if (!emailRegex.hasMatch(value)) {
      return "It's not correct email";
    }
    return null;
  }

//! ฟังชั่นเช็ค 3 words

  // var words = RegExp(r'\b\w+\b').allMatches(text).length;
  dynamic checkThreeWords(String? value) {
    if (value == null || value.isEmpty) {
      return "Please type some words";
    }

    var words = RegExp(r'\b\w+\b').allMatches(value).length;

    if (words != 3) {
      return "Please type 3 words (Your text length is $words)";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("3 Type Validation"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            MyTextForm(
              question: "Give your std id",
              valid: checkID,
            ),
            MyTextForm(
              question: "Give your email",
              valid: checkEmail,
            ),
            MyTextForm(
              question: "Give 3 words to describe yourself",
              valid: checkThreeWords,
            )
          ],
        ));
  }
}

class MyTextForm extends StatelessWidget {
  MyTextForm({super.key, required this.question, required this.valid});
  final String question;
  final Function(String?) valid;

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question),
            TextFormField(
              validator: (String? value) {
                return valid(value);
              },
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).removeCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')));
                      }
                    },
                    child: Text("Submit")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
