
import 'package:movieflutter/api/tmdb_api.dart';
import 'package:movieflutter/blocs/bloc_provider.dart';
import 'package:movieflutter/models/movie_details_model.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailsBloc extends BlocBase {

  int _id;

  // Control Sink/Stream of Movie list
  PublishSubject<MovieDetailsModel> _moviesController = PublishSubject<MovieDetailsModel>();
  Sink<MovieDetailsModel> get _inMoviesList => _moviesController.sink;
  Stream<MovieDetailsModel> get outMoviesList => _moviesController.stream;

  MovieDetailsBloc(int id) {
    this._id = id;
    api.detailsMovie(id).then((MovieDetailsModel result) => _handleApiSuccess(result),  onError: (e) => _handleError(e));
  }

  _handleApiSuccess(MovieDetailsModel result) {
    _inMoviesList.add(result);
  }

  _handleError(Error e) {

  }

  @override
  void dispose() {
    _moviesController.close();
  }

}