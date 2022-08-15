// To parse this JSON data, do
//
//     final nowPlayingResponse = nowPlayingResponseFromMap(jsonString);

import 'dart:convert';

import 'package:movies/models/response.dart';

import 'dates.dart';

class NowPlayingResponse {
  NowPlayingResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  Dates dates;
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory NowPlayingResponse.fromJson(String str) => NowPlayingResponse.fromMap(json.decode(str));


  factory NowPlayingResponse.fromMap(Map<String, dynamic> json) => NowPlayingResponse(
    dates: Dates.fromMap(json["dates"]),
    page: json["page"],
    results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );


}
