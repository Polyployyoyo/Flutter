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
        body: Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Center(
                      child: Text(
                    "Sunday Pancakes",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    softWrap: true,
                    "Fluffy, golden, and just the thing for a slow Sunday morning. These pancakes are easy to whip up and perfect for stacking high with your favourite toppings. Try drizzled with Chelsea Flavoured Maple Syrup, add fresh fruit, or go classic with butter and jam. This pancake recipe is an NZ favourite!"),
                SizedBox(
                  height: 20,
                ),
                MyStar(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyIcon(
                      icons: Icons.kitchen_outlined,
                      labels: "PREP:",
                      intLabel: "25 min",
                      colors: Colors.blueGrey,
                    ),
                    MyIcon(
                        icons: Icons.timer_outlined,
                        labels: "COOK:",
                        intLabel: "1 hr",
                        colors: Colors.blueGrey),
                    MyIcon(
                        icons: Icons.restaurant,
                        labels: "FEEDS:",
                        intLabel: "4-6",
                        colors: Colors.blueGrey)
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Image.network(
              fit: BoxFit.cover, // ขยายภาพให้เต็มจอ
              "https://40204166.fs1.hubspotusercontent-na1.net/hub/40204166/hubfs/New%20Recipe%20images/Sunday%20Pancakes%20Recipe%20NZ%20Chelsea%20Sugar.jpg?width=789&height=645&name=Sunday%20Pancakes%20Recipe%20NZ%20Chelsea%20Sugar.jpg"),
        )
      ],
    ));
  }
}

class MyStar extends StatelessWidget {
  const MyStar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star)
          ],
        ),
        Text("999 Review")
      ],
    );
  }
}

class MyIcon extends StatelessWidget {
  const MyIcon(
      {super.key,
      required this.icons,
      required this.labels,
      required this.intLabel,
      required this.colors});
  final IconData icons;
  final String labels;
  final String intLabel;
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
          height: 10,
        ),
        Text(labels),
        SizedBox(
          height: 10,
        ),
        Text(intLabel)
      ],
    );
  }
}
