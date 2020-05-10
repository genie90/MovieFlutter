
import 'dart:collection';

import 'package:movieflutter/api/tmdb_api.dart';
import 'package:movieflutter/blocs/bloc_provider.dart';
import 'package:movieflutter/models/movie_model.dart';
import 'package:movieflutter/models/movie_page_result.dart';
import 'package:rxdart/rxdart.dart';


class MovieBloc extends BlocBase {

  // Control Sink/Stream of Movie list
  PublishSubject<List<MovieModel>> _moviesController = PublishSubject<List<MovieModel>>();
  Sink<List<MovieModel>> get _inMoviesList => _moviesController.sink;
  Stream<List<MovieModel>> get outMoviesList => _moviesController.stream;

  MovieBloc() {
    api.pagedList()
        .then((MoviePageResult fetchedPage) => _handleFetchedPage(fetchedPage));
  }

  void _handleFetchedPage(MoviePageResult pageResult) {
    if (pageResult.movies.length > 0) {
      _inMoviesList.add(UnmodifiableListView<MovieModel>(pageResult.movies));
    }
  }

  @override
  void dispose() {
    _moviesController.close();
  }

}