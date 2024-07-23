import 'package:dotgame/Dot.dart';
import 'package:dotgame/ProviderClass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final gameUser = Provider.of<GameProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (_) {
          if (!gameUser.gameOver) {
            gameUser.tapDot();
          } else {
            gameUser.startGame();
          }
        },
        child: Stack(
          children: [
            Positioned(
              left: gameUser.dotPosition.dx,
              top: gameUser.dotPosition.dy,
              child: gameUser.gameOver
                  ? Text('Game Over',
                      style: TextStyle(fontSize: 30, color: Colors.red))
                  : Dot(),
            ),
          ],
        ),
      ),
    );
  }
}
