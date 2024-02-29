class Leaderboard {
  Map<String, int> _scores = {};

  List<String> get players => _scores.keys.toList();

  int get scoreForPlayer(String player) => _scores[player] ?? 0;

  void addPlayer(String player) {
    _scores[player] = 0;
  }

  void updateScore(String player, int newScore) {
    _scores[player] = newScore;
  }

  void sort() {
    _scores.entries.sort((a, b) => b.value.compareTo(a.value));
  }

  List<String> get topPlayers => _scores.entries.take(5).map((entry) => entry.key).toList();
}
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Leaderboard Example'),
        ),
        body: LeaderboardExample(),
      ),
    );
  }
}

class LeaderboardExample extends StatefulWidget {
  @override
  _LeaderboardExampleState createState() => _LeaderboardExampleState();
}

class _LeaderboardExampleState extends State<LeaderboardExample> {
  Leaderboard _leaderboard = Leaderboard();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onSubmitted: (value) {
            setState(() {
              _leaderboard.addPlayer(value);
            });
          },
          decoration: InputDecoration(
            labelText: 'Enter a player name',
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _leaderboard.players.length,
            itemBuilder: (context, index) {
              final player = _leaderboard.players[index];
              return ListTile(
                title: Text(player),
                trailing: TextFormField(
                  initialValue: _leaderboard.scoreForPlayer(player).toString(),
                  onFieldSubmitted: (value) {
                    setState(() {
                      _leaderboard.updateScore(player, int.parse(value));
                      _leaderboard.sort();
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Score',
                  ),
                ),
              );
            },
          ),
        ),
        Text('Top Players: ${_leaderboard.topPlayers.join(', ')}'),
      ],
    );
  }
}