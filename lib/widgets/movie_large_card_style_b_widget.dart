import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movieflutter/api/tmdb_api.dart';
import 'package:movieflutter/models/movie_model.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieLargeCardStyleBWidget extends StatefulWidget {
  final MovieModel movie;

  const MovieLargeCardStyleBWidget({Key key, @required this.movie})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieLargeCardStyleBWidgetState();
}

class MovieLargeCardStyleBWidgetState
    extends State<MovieLargeCardStyleBWidget> {
  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 150,
                  width: 100,
                  child: Center(child: CircularProgressIndicator()),
                ),
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: api.imageBaseUrl + widget.movie.posterPath,
                  fit: BoxFit.fill,
                  width: 100,
                  height: 150,
                ),
              ],
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      widget.movie.title,
                      maxLines: 1,
                    ),
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
            ),
          ],
        ),
      );
}
