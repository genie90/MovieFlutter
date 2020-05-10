import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieflutter/api/tmdb_api.dart';
import 'package:movieflutter/models/movie_model.dart';

class MovieLargeCardWidget extends StatefulWidget {
  final MovieModel movie;

  const MovieLargeCardWidget({Key key, @required this.movie}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieLargeCardWidgetState();
}

class MovieLargeCardWidgetState extends State<MovieLargeCardWidget> {
  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.network(
              api.imageBaseUrl + widget.movie.posterPath,
              fit: BoxFit.fitWidth,
              height: 150,
            ),
            ListTile(
              title: Text(widget.movie.title),
              subtitle: Text(
                widget.movie.overview,
                maxLines: 3,
              ),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {
                    /* ... */
                  },
                ),
              ],
            ),
          ],
        ),
      );
}
