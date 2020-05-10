
import 'package:movieflutter/blocs/bloc_provider.dart';
import 'package:movieflutter/models/movie_model.dart';
import 'package:rxdart/rxdart.dart';


class MovieBloc extends BlocBase {

  // Control Sink/Stream of Movie list
  PublishSubject<List<MovieModel>> _moviesController = PublishSubject<List<MovieModel>>();
  Sink<List<MovieModel>> get _inMoviesList => _moviesController.sink;
  Stream<List<MovieModel>> get outMoviesList => _moviesController.stream;

  @override
  void dispose() {
    _moviesController.close();
  }

}