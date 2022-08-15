// To parse this JSON data, do
//
//     final popularMovies = popularMoviesFromMap(jsonString);

import 'dart:convert';

import 'package:movies/models/popular_movie.dart';

class PopularMoviesResponse {
  PopularMoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<PopularMovie> results;
  int totalPages;
  int totalResults;

  factory PopularMoviesResponse.fromJson(String str) => PopularMoviesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PopularMoviesResponse.fromMap(Map<String, dynamic> json) => PopularMoviesResponse(
    page: json["page"],
    results: List<PopularMovie>.from(json["results"].map((x) => PopularMovie.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toMap() => {
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toMap())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}
