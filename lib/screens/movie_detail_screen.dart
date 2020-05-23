import 'package:flutter/material.dart';
import 'package:movieflutter/api/tmdb_api.dart';
import 'package:movieflutter/blocs/bloc_provider.dart';
import 'package:movieflutter/blocs/movie_details_bloc.dart';
import 'package:movieflutter/models/movie_details_model.dart';
import 'package:movieflutter/widgets/movie_details_body_widget.dart';
import 'package:movieflutter/widgets/movie_details_header_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  int _id;

  MovieDetailsScreen(this._id);

  @override
  Widget build(BuildContext context) {
    MovieDetailsBloc _movieBloc = MovieDetailsBloc(_id);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("_model.title"),
        elevation: 0.0,
      ),
      body: BlocProvider<MovieDetailsBloc>(
          bloc: _movieBloc,
          child: StreamBuilder<MovieDetailsModel>(
              stream: _movieBloc.outMoviesList,
              builder: (context, snapshot) => !snapshot.hasData
                  ? Container()
                  : Container(
                      color: Colors.black12,
                      child: Stack(
                        children: <Widget>[
                          MovieDetailsHeaderWidget(
                            imagePath:
                                api.imageHDBaseUrl + snapshot.data.backdropPath,
                            title: snapshot.data.title,
                            overview: snapshot.data.overview,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 100),
                            child: MovieDetailsBodyWidget(
                              model: snapshot.data,
                            ),
                          ),
                        ],
                      ),
                    ))),
    );
  }
}
