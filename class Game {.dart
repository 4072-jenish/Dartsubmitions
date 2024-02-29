class Game {
  int _score = 0;
  int _level = 1;

  int get score => _score;
  int get level => _level;

  void play() {
    // code to play the game goes here
    _score++;
    if (_score % 10 == 0) {
      _level++;
    }
  }

  void quit() {
    // code to quit the game goes here
    print('Game over! Your final score is $_score and your final level is $_level');
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Game App'),
        ),
        body: GameWidget(),
      ),
    );
  }
}

class GameWidget extends StatefulWidget {
  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  final Game _game = Game();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Score: ${_game.score}'),
        Text('Level: ${_game.level}'),
        RaisedButton(
          onPressed: () {
            _game.play();
            setState(() {});
          },
          child: Text('Play'),
        ),
        RaisedButton(
          onPressed: () {
            _game.quit();
          },
          child: Text('Quit'),
        ),
      ],
    );
  }
}