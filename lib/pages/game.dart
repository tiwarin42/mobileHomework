import 'dart:math';

class Game {
  final int _answer;
  int _totalGuesses = 0;
  List _list = [];

  Game() : _answer = Random().nextInt(100) + 1 {
    print('Game constructor');
  }

  int get totalGuesses => _totalGuesses;


  List get list => _list;

  int doGuess(int num) {
    _totalGuesses++;
    _list.add(num);

    if (num > _answer) {
      return 1;
    } else if (num < _answer) {
      return -1;
    } else {
      return 0;
    }
  }
}
