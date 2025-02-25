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
          ),
          QuestionButton()
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
              Text("Created by GiGi")
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

class QuestionButton extends StatelessWidget {
  const QuestionButton({super.key});

  Future<void> _navigateAndDisplay(
      BuildContext context, String question, String answer) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => QuestionScreen(question: question)));

    if (!context.mounted) return;

    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    if (result == answer) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("$result is correct!!")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("$result is wrong!!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            onPressed: () {
              _navigateAndDisplay(context, "2 + 2 = ?", "4");
            },
            child: Text("Question 1")),
        ElevatedButton(
            onPressed: () {
              _navigateAndDisplay(context, "5 + 5 = ?", "10");
            },
            child: Text("Question 2")),
        ElevatedButton(
            onPressed: () {
              _navigateAndDisplay(
                  context, "Who create these questions", "GiGi");
            },
            child: Text("Question 3"))
      ],
    );
  }
}

class QuestionScreen extends StatelessWidget {
  QuestionScreen({super.key, required this.question});

  final myController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final String question;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Question : $question",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter some text";
                  }
                  return null;
                },
                controller: myController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your answer"),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context, myController.text);
                      }
                    },
                    child: Text("Submit")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
