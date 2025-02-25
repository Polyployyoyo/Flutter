import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("MeMe Cat"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 245, 243, 239),
          surfaceTintColor: const Color.fromARGB(255, 245, 243, 239),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "images/Siamese1.jpg",
                fit: BoxFit.cover,
              ),
              TitleSection(
                name: "Siamese Cat",
                place: "Thailand",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonWithText(
                      icons: Icons.phone,
                      colors: Colors.deepPurple,
                      labels: "Call"),
                  ButtonWithText(
                      icons: Icons.near_me,
                      colors: Colors.deepPurple,
                      labels: "Route"),
                  ButtonWithText(
                      icons: Icons.share,
                      colors: Colors.deepPurple,
                      labels: "Share"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "The Siamese cat (Thai: แมวไทย, Maeo Thai; แมวสยาม, Maeo Sayam) is one of the first distinctly recognised breeds of Asian cat. It derives from the Wichianmat landrace. The Siamese cat is one of several varieties of cats native to Thailand (known as Siam before 1939). The original Siamese became one of the most popular breeds in Europe and North America in the 19th century.[1] Siamese cats have a distinctive colourpoint coat, resulting from a temperature-sensitive type of albinism. Distinct features like blue almond-shaped eyes, a triangular head shape, large ears, an elongated, slender, and muscular body, and various forms of point colouration characterise the modern-style Siamese. The modern-style Siamese's point-colouration resembles the \"old-style\" foundation stock. The \"old-style\" Siamese have a round head and body. They have been re-established by multiple registries as the Thai cat. Siamese and Thai cats are selectively bred and pedigreed in multiple cat fancier and breeder organisations. The terms \"Siamese\" or \"Thai\" are used for cats from this specific breed, which are by definition all purebred cats with a known and formally registered ancestry. The ancestry registration is the cat's pedigree or \"paperwork\"",
                  softWrap: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatefulWidget {
  const TitleSection({super.key, required this.place, required this.name});

  final String name;
  final String place;

  @override
  State<TitleSection> createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection> {
  bool _isFavorite = false;
  int _like = 119;

  void toggle() {
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
        _like--;
      } else {
        _isFavorite = true;
        _like++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  widget.place,
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: IconButton(
              onPressed: toggle,
              icon: Icon(
                _isFavorite ? Icons.star : Icons.star_border,
                color: _isFavorite ? Colors.red : Colors.black,
              ),
            ),
          ),
          Text("$_like")
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText(
      {super.key,
      required this.icons,
      required this.colors,
      required this.labels});

  final IconData icons;
  final String labels;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icons,
          color: colors,
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          labels,
          style: TextStyle(color: colors),
        )
      ],
    );
  }
}
