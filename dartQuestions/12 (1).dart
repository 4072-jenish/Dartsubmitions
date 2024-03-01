class Game {
  int score;
  int level;
  Game({required this.score, required this.level});
  void play() {
    score += 10;
    level += 1;
    print('Played the game. New score: $score, New level: $level');
  }
  void saveProgress() {
    print('Progress saved. Score: $score, Level: $level');
  }
}
void main() {
  final game = Game(score: 0, level: 1);
  game.play();
  game.play();
  game.saveProgress();
}