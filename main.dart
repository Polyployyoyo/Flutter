import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MainApp(),
    title: "Question Game",
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool question1IsCorrect = false;
  bool question2IsCorrect = false;
  bool question3IsCorrect = false;

  void toggleCorrect(int questionID) {
    setState(() {
      if (questionID == 1) {
        question1IsCorrect = true;
      } else if (questionID == 2) {
        question2IsCorrect = true;
      } else if (questionID == 3) {
        question3IsCorrect = true;
      }
    });
  }

  Future<void> _navigateAndDisplaySelection(
      BuildContext context,
      String question,
      String answer,
      int questionID,
      bool isCaseSensitive) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => QuestionScreen(question: question)),
    );

    if (!context.mounted) return;

    if (!isCaseSensitive) {
      result = result.toLowerCase();
      answer = answer.toLowerCase();
    }

    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    if (result == answer) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Correct!!')));
      toggleCorrect(questionID);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Wrong answer!!, your answer is "$result"')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question Game"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              "https://images.squarespace-cdn.com/content/v1/663f738a89dc02694adb8670/ab586c91-6b0b-4791-aa5a-b60824f92094/OIIA-Website-loop.gif?format=1500w",
              fit: BoxFit.cover,
            ),
            TitleSection(title: "MeMe Questions", creater: "BankyEiEi"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: question1IsCorrect
                      ? null
                      : () {
                          _navigateAndDisplaySelection(
                              context, "2 + 2 = ??", "4", 1, false);
                        },
                  child: Text("Question 1"),
                ),
                ElevatedButton(
                    onPressed: question2IsCorrect
                        ? null
                        : () {
                            _navigateAndDisplaySelection(
                                context,
                                "What kind of cat is this phrase?\n\n\"Distinct features like blue almond-shaped eyes, a triangular head shape, large ears, an elongated, slender, and muscular body, and various forms of point colouration characteristic\"",
                                "Siamese",
                                2,
                                false);
                          },
                    child: Text("Question 2")),
                ElevatedButton(
                    onPressed: question3IsCorrect
                        ? null
                        : () {
                            _navigateAndDisplaySelection(
                                context,
                                "Who created these question? (Case-sensitive)",
                                "BankyEiEi",
                                3,
                                true);
                          },
                    child: Text("Question 3")),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                question1IsCorrect && question2IsCorrect && question3IsCorrect
                    ? "You complete all questions!!"
                    : "",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TitleSection extends StatefulWidget {
  const TitleSection({super.key, required this.title, required this.creater});

  final String title;
  final String creater;

  @override
  State<TitleSection> createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection> {
  bool _isFavorite = false;
  int _favorite = 888;

  void favoriteToggle() {
    setState(() {
      _isFavorite = !_isFavorite;
      if (_isFavorite) {
        _favorite++;
      } else {
        _favorite--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Created by ${widget.creater}",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: IconButton(
              icon:
                  Icon(_isFavorite ? Icons.thumb_up : Icons.thumb_up_outlined),
              color: _isFavorite ? Colors.red : Colors.black,
              onPressed: () {
                favoriteToggle();
              },
            ),
          ),
          Text(
            "$_favorite",
          ),
        ],
      ),
    );
  }
}

class QuestionScreen extends StatelessWidget {
  QuestionScreen({super.key, required this.question});

  final String question;

  final _formKey = GlobalKey<FormState>();
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Question : $question",
                softWrap: true,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: textController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter some answer";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Type your answer"),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pop(context, textController.text);
                        }
                      },
                      child: Text("Submit")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
