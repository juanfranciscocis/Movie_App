import 'dart:convert';

import 'package:movies/models/tv_show.dart';

class PopularTvShowResponse {
  PopularTvShowResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<TvShow> results;
  int totalPages;
  int totalResults;

  factory PopularTvShowResponse.fromJson(String str) => PopularTvShowResponse.fromMap(json.decode(str));

  factory PopularTvShowResponse.fromMap(Map<String, dynamic> json) => PopularTvShowResponse(
    page: json["page"],
    results: List<TvShow>.from(json["results"].map((x) => TvShow.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );


}