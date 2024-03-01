class MusicPlayer {
  List<String> playlist = [];
  int volume = 50;
  String currentSong = '';
  MusicPlayer({required this.playlist, required this.volume});
  void play() {
    if (playlist.isNotEmpty) {
      currentSong = playlist.removeAt(0);
      print('Playing $currentSong at volume $volume.');
    } else {
      print('Playlist is empty.');
    }
  }
  void pause() {
    if (currentSong.isNotEmpty) {
      print('Pausing $currentSong.');
    } else {
      print('Nothing is currently playing.');
    }
  }
  void addToPlaylist(String song) {
    playlist.add(song);
    print('$song has been added to the playlist.');
  }
  void removeFromPlaylist(String song) {
    if (playlist.contains(song)) {
      playlist.remove(song);
      print('$song has been removed from the playlist.');
    } else {
      print('$song is not in the playlist.');
    }
  }
  void setVolume(int newVolume) {
    if (newVolume >= 0 && newVolume <= 100) {
      volume = newVolume;
      print('Volume set to $volume.');
    } else {
      print('Invalid volume value.');
    }
  }
}
void main() {
  final player = MusicPlayer(playlist: ['song1', 'song2', 'song3'], volume: 70);
  player.play();
  player.pause();
  player.addToPlaylist('song4');
  player.removeFromPlaylist('song2');
  player.setVolume(90);
}