// To parse this JSON data, do
//
//     final movieCast = movieCastFromMap(jsonString);

import 'dart:convert';

import 'movie_cast.dart';

class MovieCastResponse {
  MovieCastResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  int id;
  List<Cast> cast;
  List<Cast> crew;

  factory MovieCastResponse.fromJson(String str) => MovieCastResponse.fromMap(json.decode(str));

  factory MovieCastResponse.fromMap(Map<String, dynamic> json) => MovieCastResponse(
    id: json["id"],
    cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
    crew: List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
  );

}
