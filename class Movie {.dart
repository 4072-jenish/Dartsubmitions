class Movie {
  String title;
  String director;
  List<String> actors;

  Movie(this.title, this.director, this.actors);

  @override
  String toString() {
    return 'Movie(title: $title, director: $director, actors: $actors)';
  }
}