import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  Offset dotPosition = Offset(100, 100);
  bool gameOver = false;
  Timer? _timer;
  int count = 0;

  void startGame() {
    gameOver = false;
    notifyListeners();
    _moveDot();
  }

  void _moveDot() {
    if (gameOver) return;

    dotPosition = Offset(
      Random().nextDouble() * 300,
      Random().nextDouble() * 600,
    );
    notifyListeners();

    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer(Duration(seconds: 2), () {
      if (!gameOver) {
        endGame();
      }
    });
  }

  void tapDot() {
    count++;
    if (!gameOver) {
      dotPosition = Offset(
        Random().nextDouble() * 300,
        Random().nextDouble() * 600,
      );
      notifyListeners();
      _startTimer();
    }
  }

  void endGame() {
    gameOver = true;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
