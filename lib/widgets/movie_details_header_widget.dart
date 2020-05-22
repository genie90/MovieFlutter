import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieDetailsHeaderWidget extends StatefulWidget {
  @required
  final String imagePath;
  final String title;
  final String overview;

  const MovieDetailsHeaderWidget(
      {Key key,
      @required this.imagePath,
      @required this.title,
      @required this.overview})
      : super(key: key);

  @override
  _MovieDetailsHeaderWidgetState createState() =>
      _MovieDetailsHeaderWidgetState();
}

class _MovieDetailsHeaderWidgetState extends State<MovieDetailsHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: GenieClipper(),
          child: Stack(
            children: <Widget>[
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.imagePath,
                fit: BoxFit.fitWidth,
                height: 300,
                width: MediaQuery.of(context).size.width,
              ),
              Positioned.fill(
                child: new Material(
                  color: Colors.black38,
                  child: new InkWell(
                    onTap: () => {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
