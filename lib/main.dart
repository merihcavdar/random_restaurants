import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> restaurants = [
    'Carl\'s Junior',
    'McDonald\'s',
    'KFC',
    'Happy Moon\'s',
    'Pizza Hut',
    'Develi',
    'Domino\'s',
    'Burger King',
    'Kayseri Mutfağı',
  ];
  int? currentIndex;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Where do you want to eat?'),
            if (currentIndex != null)
              Text(
                restaurants[currentIndex!],
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            const Padding(
              padding: EdgeInsets.only(
                top: 50.0,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                updateIndex();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: const Text('Pick a restaurant'),
            ),
          ],
        ),
      ),
    ));
  }

  void updateIndex() {
    final random = Random();
    var index = 0;
    while (index == currentIndex) {
      index = random.nextInt(restaurants.length);
    }

    setState(() {
      currentIndex = index;
    });
  }
}
