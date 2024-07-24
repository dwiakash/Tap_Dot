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
      appBar: AppBar(
        title: Text('Score: ${gameUser.count.toString()}'),
      ),
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
              child: gameUser.gameOver ? SizedBox.shrink() : Dot(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: gameUser.gameOver
          ? GestureDetector(
              onTap: () {
                gameUser.startGame();
              },
              child: BottomAppBar(
                color: Colors.black,
                child: Text(
                  'Game Over - Tap to Restart',
                  style: TextStyle(fontSize: 30, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : SizedBox.shrink(),
    );
  }
}
