import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/GameScreen.dart';

void main() {
  runApp(const RockPaperScissorsApp());
}

class RockPaperScissorsApp extends StatelessWidget {
  const RockPaperScissorsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const GameScreen());
  }
}
