import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/utils/MovieParser.dart';

class Movieprovider extends ChangeNotifier{
  List<Movie> _moviesList = [];

List<Movie> get movieList => _moviesList;

Future<void> loadMovies(BuildContext context) async {
  try {
    final jsonString = await DefaultAssetBundle.of(context) 
      .loadString('assets/data/film.json');

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