import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movieflutter/api/tmdb_api.dart';
import 'package:movieflutter/models/movie_model.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieSmallCardStyleAWidget extends StatefulWidget {
  final MovieModel movie1;
  final MovieModel movie2;

  const MovieSmallCardStyleAWidget(
      {Key key, @required this.movie1, @required this.movie2})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieSmallCardStyleAWidgetState();
}

class MovieSmallCardStyleAWidgetState
    extends State<MovieSmallCardStyleAWidget> {
  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Expanded(
            child: SmallCardWidget(movie: widget.movie1),
          ),
          Expanded(
            child: SmallCardWidget(movie: widget.movie2),
          ),
        ],
      );
}

class SmallCardWidget extends StatefulWidget {
  final MovieModel movie;

  const SmallCardWidget({Key key, @required this.movie}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SmallCardWidgetState();
}

class SmallCardWidgetState extends State<SmallCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 200,
              child: Center(
                  child: CircularProgressIndicator()),
            ),
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: api.imageBaseUrl + widget.movie.posterPath,
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
              height: 200,
            ),
          ],
        ),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: const Text('BUY TICKETS'),
              onPressed: () => {},
            ),
          ],
        ),
      ]),
    );
  }
}
