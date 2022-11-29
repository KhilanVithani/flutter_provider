import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../model/movie_model.dart';

final List<Movie> initalData = List.generate(
    50,
    (index) => Movie(
        title: "Movie ${index}",
        duration: "${Random().nextInt(100) + 60} Minutes"));

class MovieProvider with ChangeNotifier {
  final List<Movie> _movies = initalData;
  List<Movie> get movies => _movies;

  final List<Movie> _myList = [];
  List<Movie> get myList => _myList;

  void addToList(Movie movie) {
    _myList.add(movie);
    notifyListeners();
  }

  void removeToList(Movie movie) {
    _myList.remove(movie);
    notifyListeners();
  }
}
