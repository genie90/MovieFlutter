
import 'movie_model.dart';

class MoviePageResult {
  final int pageIndex;
  final int totalResults;
  final int totalPages;
  final List<MovieModel> movies;

  MoviePageResult.fromJSON(Map<String, dynamic> json)
    : pageIndex = json['page'],
      totalResults = json['total_results'],
      totalPages = json['total_pages'],
      movies = (json['results'] as List).map((json) => MovieModel.fromJSON(json)).toList();
}