import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Text Screen Training",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Three words app"),
        ),
        body: Center(
          child: MyButton(),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 280,
          child: ElevatedButton(
              onPressed: () {
                _navigateAndDisplaySelection(context, TextScreen1());
              },
              child: Text("Give me three words!! \"Press Enter\"")),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 280,
          child: ElevatedButton(
              onPressed: () {
                _navigateAndDisplaySelection(context, TextScreen2());
              },
              child: Text("Give me three words!! \"Click Button\"")),
        ),
      ],
    );
  }

  Future<void> _navigateAndDisplaySelection(
      BuildContext context, Widget screen) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    ); // โค้ดนี้จะจบก็ต่อเมื่อ หน้าที่เปิดมานั้น ส่งค่ามาหน้าแรก แล้วปิดหน้าตัวเองไป

    if (!context.mounted) return;

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }
}

//* Screen 1 "Press Enter"
class TextScreen1 extends StatelessWidget {
  TextScreen1({super.key});

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter your text"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.tealAccent, // ซ่อนปุ่มย้อนกลับ
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: TextFormField(
            validator: (value) {
              if (value!.length <= 4) {
                return "Please type more than 4 character";
              }
              return null;
            },
            onFieldSubmitted: (value) {
              if (_formKey.currentState!.validate()) {
                Navigator.pop(context, "Press Enter => $value");
              }
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Type something..."),
          ),
        ),
      ),
    );
  }
}
//* End of Screen 1

//* Screen 2 "Press Button"
class TextScreen2 extends StatelessWidget {
  TextScreen2({super.key});

  final myController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter your text"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.tealAccent, // ซ่อนปุ่มย้อนกลับ
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: myController,
                validator: (value) {
                  if (value!.length <= 4) {
                    return "Please type more than 4 character";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Type something..."),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(
                          context, "Click Button => ${myController.text}");
                    }
                  },
                  child: Text("Enter"))
            ],
          ),
        ),
      ),
    );
  }
}
//* End of Screen 2
