// To parse this JSON data, do
//
//     final movieAndTvSearchResponse = movieAndTvSearchResponseFromMap(jsonString);

import 'dart:convert';

import 'package:movies/models/movie.dart';

class MovieAndTvSearchResponse {
  MovieAndTvSearchResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory MovieAndTvSearchResponse.fromJson(String str) => MovieAndTvSearchResponse.fromMap(json.decode(str));


  factory MovieAndTvSearchResponse.fromMap(Map<String, dynamic> json) => MovieAndTvSearchResponse(
    page: json["page"],
    results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );


}
