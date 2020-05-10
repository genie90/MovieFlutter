import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieflutter/blocs/bloc_provider.dart';
import 'package:movieflutter/blocs/movie_bloc.dart';
import 'package:movieflutter/models/movie_model.dart';
import 'package:movieflutter/widgets/movie_large_card_widget.dart';

class DashboardScreen extends StatelessWidget {
  final items = List<MovieModel>.generate(
      1000,
      (i) => MovieModel(
          i, "Item $i", "https://Poster.c/123/123.jpg", "Overview $i"));

  @override
  Widget build(BuildContext context) {
    final MovieBloc movieBloc = BlocProvider.of<MovieBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
      ),
      body: BlocProvider<MovieBloc>(
        bloc: MovieBloc(),
        child: StreamBuilder<List<MovieModel>>(
            stream: movieBloc.outMoviesList,
            builder: (BuildContext context,
                    AsyncSnapshot<List<MovieModel>> snapshot) =>
                ListView.builder(
                    itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                    itemBuilder: (context, index) =>
                        MovieLargeCardWidget(movie: snapshot.data[index]))),
      ),
    );
  }
}
