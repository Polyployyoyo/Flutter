import 'package:flutter/material.dart';

//* Create Class for sending data
class Welcome {
  final String username;
  final String password;

  const Welcome(this.username, this.password);
}

void main() {
  runApp(MaterialApp(
    home: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _formKey = GlobalKey<FormState>();
  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Icon(Icons.pets),
            Text("Pet Shop"),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: usernameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "*Required";
                } else if (!emailRegex.hasMatch(value)) {
                  return "Please type email";
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
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "*Required";
                  } else if (value.length <= 6) {
                    return "Please type more than 6 charecter";
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: "Password")),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      passwordController.clear();
                      usernameController.clear();
                    },
                    child: Text("CANSEL")),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).removeCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Login Success")));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyWelcomeScreen(),

                                //* Send data
                                settings: RouteSettings(
                                    arguments: Welcome(usernameController.text,
                                        passwordController.text))));
                      }
                    },
                    child: Text("NEXT"))
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class MyWelcomeScreen extends StatelessWidget {
  const MyWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //* Get data form "settings" parameter
    final todo = ModalRoute.of(context)!.settings.arguments as Welcome;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Welcome"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
                "https://media1.tenor.com/m/VpexEPCnCvcAAAAd/cat-side-eye-cat.gif"),
            Text("Username: ${todo.username}")
          ],
        ),
      ),
    );
  }
}
