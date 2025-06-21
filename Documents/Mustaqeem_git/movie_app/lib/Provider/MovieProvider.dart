import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/utils/MovieParser.dart';

class Movieprovider extends ChangeNotifier{
  List<Movie> _moviesList = [
  // "Avatar",
  // "I Am Legend",
  // "300",
  // "The Avengers",
  // "The Wolf of Wall Street",
  // "Interstellar",
  // "Game of Thrones",
  // "Vikings",
  // "Gotham",
  // "Power",
  // "Narcos",
  // "Breaking Bad",
  // "Doctor Strange",
  // "Rogue One: A Star Wars Story",
  // "Assassin's Creed",
  // "Luke Cage",

];

List<Movie> get movieList => _moviesList;

Future<void> loadMovies(BuildContext context) async {
  try {
    final jsonString = await DefaultAssetBundle.of(context) 
      .loadString('assets/data/films.json');

      final movies = MovieParser.parse(jsonString);

      _moviesList = movies;
      notifyListeners();
  }
  catch(e) {
    print("error loading movies: $e");
  }
}

// List<String> loadMovies() {
//   return _moviesList;
// }

}