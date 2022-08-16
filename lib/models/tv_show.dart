import 'dart:convert';

class TvShow {
  TvShow({
    required this.backdropPath,
    required this.firstAirDate,
    required this.genreIds,
    required this.id,
    required this.title,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
  });

  String backdropPath;
  DateTime firstAirDate;
  List<int> genreIds;
  int id;
  String title;
  List<String> originCountry;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  double voteAverage;
  int voteCount;

  factory TvShow.fromJson(String str) => TvShow.fromMap(json.decode(str));

  factory TvShow.fromMap(Map<String, dynamic> json) => TvShow(
    backdropPath: json["backdrop_path"],
    firstAirDate: DateTime.parse(json["first_air_date"]),
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"],
    title: json["name"],
    originCountry: List<String>.from(json["origin_country"].map((x) => x)),
    originalLanguage: json["original_language"],
    originalTitle: json["original_name"],
    overview: json["overview"],
    popularity: json["popularity"].toDouble(),
    posterPath: json["poster_path"],
    voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"],
  );


  getFullUrl(){
    return 'https://image.tmdb.org/t/p/w500/$posterPath';
  }

  getFullUrlBackdrop(){
    return 'https://image.tmdb.org/t/p/w500/$backdropPath';
  }

}
