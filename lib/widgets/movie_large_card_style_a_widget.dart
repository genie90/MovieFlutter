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
        child: Stack(
          children: <Widget>[
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.srcOver),
                child: Image.network(
                  api.imageBaseUrl + widget.movie.posterPath,
                  fit: BoxFit.fitWidth,
                  height: 200,
                ),
              ),
            ),
            Container(
              height: 260,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Spacer(),
                  ListTile(
                    title: Text(
                      widget.movie.title,
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .apply(color: Colors.white70),
                    ),
                    subtitle: Text(
                      widget.movie.overview,
                      maxLines: 3,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle
                          .apply(color: Colors.white70),
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
            ),
          ],
        ),
      );
}
