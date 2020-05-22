import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movieflutter/api/tmdb_api.dart';
import 'package:movieflutter/blocs/bloc_provider.dart';
import 'package:movieflutter/models/movie_model.dart';
import 'package:movieflutter/models/movie_page_result.dart';
import 'package:movieflutter/screens/movie_detail_screen.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc extends BlocBase {

  final int _moviesPerPage = 20;

  List<MovieModel> movieList = List<MovieModel>();

  //Control index of all movies
  List<int> pageList = List<int>();
  PublishSubject<int> _indexController = PublishSubject<int>();
  Sink<int> get inIndex => _indexController.sink;
  Stream<int> get _outIndex => _indexController.stream;


  // Control Sink/Stream of Movie list
  PublishSubject<List<MovieModel>> _moviesController = PublishSubject<List<MovieModel>>();
  Sink<List<MovieModel>> get _inMoviesList => _moviesController.sink;
  Stream<List<MovieModel>> get outMoviesList => _moviesController.stream;

  MovieBloc() {
    log('GENIE MovieBloc');
    _outIndex.listen(_handleIndex);
  }

  void _handleIndex(int index) {
    int page = 1 + (index + 5) ~/ _moviesPerPage;
    log("GENIE 2: " + page.toString());

    if (!pageList.contains(page)) {
      pageList.add(page);

      api.pagedList(page).then(
              (MoviePageResult fetchedPage) => _handleFetchedPage(fetchedPage), onError: (e) => _handleError(e));
    }

  }

  void _handleError(Error error) {
    log(error.toString());
  }

  void _handleFetchedPage(MoviePageResult pageResult) {
    if (pageResult.movies.length > 0) {
      movieList.addAll(pageResult.movies);
      _inMoviesList.add(UnmodifiableListView<MovieModel>(movieList));
    }
  }

  void handleMovieTap(BuildContext context, MovieModel model) {
    log('GENIE Tap on ' + model.title);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MovieDetailsScreen(model)),
    );
  }

  @override
  void dispose() {
    _moviesController.close();
    _indexController.close();
  }
}
