import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieflutter/models/movie_model.dart';
import 'package:movieflutter/widgets/movie_large_card_widget.dart';

class DashboardScreen extends StatelessWidget {
  final items = List<MovieModel>.generate(
      1000,
      (i) => MovieModel(
          i, "Item $i", "https://Poster.c/123/123.jpg", "Overview $i"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => MovieLargeCardWidget()),
    );
  }
}
