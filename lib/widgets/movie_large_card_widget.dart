import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieLargeCardWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MovieLargeCardWidgetState();
}

class MovieLargeCardWidgetState extends State<MovieLargeCardWidget> {
  StreamSubscription _subscription;

  @override
  Widget build(BuildContext context) => Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.network(
              'https://picsum.photos/480?image=9',
              fit: BoxFit.fill,
            ),
            const ListTile(
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {
                    /* ... */
                  },
                ),
                FlatButton(
                  child: const Text('LISTEN'),
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

class _SquareClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return new Rect.fromLTWH(0.0, 0.0, size.width, size.width);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
