import 'dart:math';

import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final List<String> choices = ['✊', '🖐️', '✌️'];
  String playerChoice = '❓';
  String computerChoice = '❓';
  int playerScore = 0;
  int computerScore = 0;
  String resultMessage = '';

  void playGame(String playerMove) {
    String compMove = choices[Random().nextInt(3)];
    String message;

    if (playerMove == compMove) {
      message = 'It is a Tie';
    } else if ((playerMove == '✊' && compMove == '✌️') ||
        (playerMove == '🖐️' && compMove == '✊') ||
        (playerMove == '✌️' && compMove == '🖐️')) {
      playerScore++;
      message = 'You Win';
    } else {
      computerScore++;
      message = 'You Lose';
    }

    setState(() {
      playerChoice = playerMove;
      computerChoice = compMove;
      resultMessage = message;
    });
  }

  void resetGame() {
    setState(() {
      playerChoice = '❓';
      computerChoice = '❓';
      playerScore = 0;
      computerScore = 0;
      resultMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Let's Play Rock-Paper-Scissors",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            Column(
              children: [
                Text(
                  'You: $playerChoice',
                  style: const TextStyle(fontSize: 26),
                ),
                const SizedBox(height: 10),
                Text(
                  'Computer: $computerChoice',
                  style: const TextStyle(fontSize: 26),
                ),
              ],
            ),

            if (resultMessage.isNotEmpty)
              Text(
                resultMessage,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                actionButton('assets/rock.png', '✊'),
                actionButton('assets/paper.png', '🖐️'),
                actionButton('assets/scissors.png', '✌️'),
              ],
            ),

            Text(
              'Your Score: $playerScore   Computer Score: $computerScore',
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),

            IconButton(
              icon: const Icon(Icons.restart_alt, size: 40, color: Colors.red),
              onPressed: resetGame,
            ),
          ],
        ),
      ),
    );
  }

  Widget actionButton(String imagePath, String move) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => playGame(move),
        child: Image.asset(imagePath, width: 70),
      ),
    );
  }
}
