
import 'package:movieflutter/blocs/bloc_provider.dart';
import 'package:movieflutter/models/movie_details_model.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailsBloc extends BlocBase {

  // Control Sink/Stream of Movie list
  PublishSubject<MovieDetailsModel> _moviesController = PublishSubject<MovieDetailsModel>();
  Sink<MovieDetailsModel> get _inMoviesList => _moviesController.sink;
  Stream<MovieDetailsModel> get outMoviesList => _moviesController.stream;

  @override
  void dispose() {
    _moviesController.close();
  }

}