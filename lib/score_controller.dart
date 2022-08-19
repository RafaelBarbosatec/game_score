import 'package:flutter/material.dart';

class ScoreController extends ChangeNotifier {
  int _score = 0;

  int get score => _score;

  void increment({int qtd = 1}) {
    _score+=qtd;
    notifyListeners();
  }

  void decrement({int qtd = 1}) {
    _score -= qtd;
    notifyListeners();
  }
}
