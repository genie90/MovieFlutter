import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieflutter/blocs/bloc_provider.dart';
import 'package:movieflutter/blocs/movie_bloc.dart';
import 'package:movieflutter/models/movie_model.dart';
import 'package:movieflutter/widgets/movie_large_card_style_a_widget.dart';
import 'package:movieflutter/widgets/movie_large_card_style_b_widget.dart';
import 'package:movieflutter/widgets/movie_small_card_style_a_widget.dart';

class DashboardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    log('GENIE build dashboard');
    final MovieBloc movieBloc = MovieBloc();
    movieBloc.inIndex.add(0);
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
      ),
      body: BlocProvider<MovieBloc>(
        bloc: movieBloc,
        child: StreamBuilder<List<MovieModel>>(
          stream: movieBloc.outMoviesList,
          builder: (BuildContext context,
                  AsyncSnapshot<List<MovieModel>> snapshot) =>
              ListView.builder(
                  itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                  itemBuilder: (context, index) {
                    movieBloc.inIndex.add(index);
                    log('Genie1: ' + index.toString());
                    return Container(
                        margin: index % 4 == 1 ? null : EdgeInsets.all(8.0),
                        child: _getCorrectCard(index, snapshot.data),
                    );
                  }),
        ),
      ),
    );
  }

  Widget _getCorrectCard(int index, List<MovieModel> movies) {
    switch(index % 4) {
      case 0:
        return MovieLargeCardWidget(movie: movies[index]);
        break;
      case 2:
        return MovieSmallCardStyleAWidget(movie1: movies[index-1], movie2: movies[index],);
        break;
      case 3:
        return MovieLargeCardStyleBWidget(movie: movies[index]);
        break;
      default:
        return Container(width: 0.0, height: 0.0, padding: EdgeInsets.all(0),);
    }
  }
}
