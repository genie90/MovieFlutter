import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:movieflutter/models/movie_page_result.dart';


///
/// TMDB API
/// 
/// To get an API key, it is FREE => go to "https://www.themoviedb.org/"
/// 

class TmdbApi {
  static const String TMDB_API_KEY = "dcb09c51e7d2c58d4a1b97f9533fbe90";
  static const String baseUrl = 'api.themoviedb.org';
  final String imageBaseUrl = 'http://image.tmdb.org/t/p/w180/';
  final _httpClient = new HttpClient();

  ///
  /// Returns the list of movies/tv-show, based on criteria:
  /// [type]: movie or tv (show)
  /// [pageIndex]: page
  /// [minYear, maxYear]: release dates range
  /// [genre]: genre
  ///
  Future<MoviePageResult> pagedList(int page) async {
    var uri = Uri.https(
      baseUrl,
      '3/movie/popular',
      <String, String>{
        'api_key': TMDB_API_KEY,
        'page': page.toString(),
      },
    );

    log('Genie ' + uri.toString());

    var response = await _getRequest(uri);

    log(response);

    MoviePageResult list = MoviePageResult.fromJSON(json.decode(response));

    // Give some additional delay to simulate slow network
    await Future.delayed(const Duration(seconds: 1));

    return list;
  }

  ///
  /// Routine to invoke the TMDB Web Server to get answers
  ///
  Future<String> _getRequest(Uri uri) async {
    var request = await _httpClient.getUrl(uri);
    var response = await request.close();

    return response.transform(utf8.decoder).join();
  }
}

TmdbApi api = TmdbApi();
