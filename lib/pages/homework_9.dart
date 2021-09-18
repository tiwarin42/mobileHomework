import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'game.dart';

class HomeWork9 extends StatefulWidget {
  const HomeWork9({Key? key}) : super(key: key);

  @override
  _HomeWork9State createState() => _HomeWork9State();
}

class _HomeWork9State extends State<HomeWork9> {
  late Game _game;
  final _controller = TextEditingController();
  String? _guessNumber;
  String? _feedback;
  bool newGame = false;

  @override
  void initState() {
    super.initState();
    _game = Game();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.tealAccent,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHeader(),
                _buildMainContent(),
                _buildInputpanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo_number.png',
          width: 240.0,
        ),
        Text(
          'GUESS THE NUMBER',
          style: GoogleFonts.kanit(fontSize: 30.0, color: Colors.teal[900]),
        ),
      ],
    );
  }

  Widget _buildMainContent() {
    return _guessNumber == null
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('I\'m thinking of number between 1 and 100.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.kanit(
                        fontSize: 24.0, color: Colors.teal[900])),
                Text('Can you guess it?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.kanit(
                        fontSize: 24.0, color: Colors.teal[900])),
              ],
            ),
          )
        : _feedback == 'CORRECT!'
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _guessNumber!,
                    style: TextStyle(fontSize: 100.0, color: Colors.black87),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.green[800],
                        size: 60.0,
                      ),
                      Text(
                        _feedback!,
                        style: TextStyle(fontSize: 40.0, color: Colors.black87),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _game = Game();
                        newGame = false;
                        _guessNumber = null;
                        _feedback = null;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'NEW GAME',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ],
              )
            : _feedback == ''
                ? SizedBox.shrink()
                : Column(
                    children: [
                      Text(
                        _guessNumber!,
                        style:
                            TextStyle(fontSize: 100.0, color: Colors.blueGrey),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.clear,
                            color: Colors.red,
                            size: 60.0,
                          ),
                          Text(
                            _feedback!,
                            style: TextStyle(
                                fontSize: 40.0, color: Colors.black87),
                          ),
                        ],
                      ),
                    ],
                  );
  }

  Widget _buildInputpanel() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  color: Colors.teal,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                cursorColor: Colors.teal,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  isDense: true,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  hintText: 'Enter the number here',
                  hintStyle: TextStyle(
                    color: Colors.teal.withOpacity(0.5),
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _guessNumber = _controller.text;
                  int? guess = int.tryParse(_guessNumber!);
                  if (guess != null) {
                    var result = _game.doGuess(guess);
                    var totalGuesses = _game.totalGuesses;
                    if (result == 0) {
                      newGame = true;
                      _feedback = 'CORRECT!';
                      _showMaterialDialog(
                          "GOOD JOB!",
                          'The answer is $_guessNumber\n'
                              'You have made $totalGuesses guuesses.\n\n > ${_game.list}');
                      _controller.clear();
                    } else if (result == 1) {
                      _feedback = 'TOO HIGH!';
                      _controller.clear();
                    } else {
                      _feedback = 'TOO LOW!';
                      _controller.clear();
                    }
                  } else {
                    _feedback = '';
                    _showMaterialDialog('Error', 'Please enter the number');
                    _controller.clear();
                    newGame = false;
                  }
                });
              },
              child: Text(
                'GUESS',
                style: GoogleFonts.kanit(
                  fontSize: 20.0,
                  color: Colors.teal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
