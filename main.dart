import 'package:flutter/material.dart';

//* Create Class for sending data
class Welcome {
  final String username;
  final String password;

  const Welcome(this.username, this.password);
}

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
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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
              controller: usernameController,
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
              controller: passwordController,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      usernameController.clear();
                      passwordController.clear();
                    },
                    child: Text("Cancel")),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(
                              SnackBar(content: Text("Login Success")));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeScreen(),
                                //* Send data
                                settings: RouteSettings(
                                    arguments: Welcome(usernameController.text,
                                        passwordController.text))));
                      }
                    },
                    child: Text("Login")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //* Get data form "settings" parameter
    final todo = ModalRoute.of(context)!.settings.arguments as Welcome;

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Screen"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Welcome, ${todo.username}",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text("Your password is ${todo.password}"),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                Navigator.pop(context);
              },
              child: Text(
                "Go back!",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ))
        ]),
      ),
    );
  }
}
