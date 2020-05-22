import 'package:flutter/material.dart';
import 'package:movieflutter/api/tmdb_api.dart';
import 'package:movieflutter/models/movie_model.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieDetailsBodyWidget extends StatefulWidget {
  @required
  final MovieModel model;

  const MovieDetailsBodyWidget({Key key, @required this.model})
      : super(key: key);

  @override
  _MovieDetailsBodyWidgetState createState() => _MovieDetailsBodyWidgetState();
}

var _rating;

class _MovieDetailsBodyWidgetState extends State<MovieDetailsBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: 48.0),
            width: MediaQuery.of(context).size.width,
            height: 500,
            child: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 8, left: 128),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 2),
                            child: Text(
                              widget.model.title,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.title,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 4, bottom: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                RatingBar(
                                  onRatingChanged: (rating) =>
                                      setState(() => _rating = rating),
                                  filledIcon: Icons.star,
                                  emptyIcon: Icons.star_border,
                                  halfFilledIcon: Icons.star_half,
                                  isHalfAllowed: true,
                                  filledColor: Theme.of(context).primaryColor,
                                  emptyColor:
                                      Theme.of(context).textSelectionColor,
                                  halfFilledColor: Colors.amberAccent,
                                  size: 24,
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 2),
                              child: Text(
                                widget.model.overview,
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .apply(color: Colors.pink),
                              )),
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 110),
                    padding: EdgeInsets.all(12),
                    child: DefaultTabController(
                      length: 4,
                      child: TabBar(
                        isScrollable: true,
                        unselectedLabelColor: Colors.black38,
                        labelColor: Theme.of(context).primaryColor,
                        tabs: [
                          Tab(
                            child: Text("INFO"),
                          ),
                          Tab(
                            child: Text("CAST"),
                          ),
                          Tab(
                            child: Text("REVIEWS"),
                          ),
                          Tab(
                            child: Text("AWARDS"),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: api.imageBaseUrl + widget.model.posterPath,
                fit: BoxFit.fill,
                width: 100,
                height: 150,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GenieClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 100);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
