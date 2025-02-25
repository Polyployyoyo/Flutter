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
        title: Text("Test Validation"),
        backgroundColor: const Color.fromARGB(255, 129, 188, 237),
      ),
      body: MyTextForm(),
    );
  }
}

class MyTextForm extends StatelessWidget {
  MyTextForm({super.key});

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "*Required";
                }
                return null;
              },
              decoration: InputDecoration(labelText: "Username"),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "*Required";
                }
                return null;
              },
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Login Success")));
                  }
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
