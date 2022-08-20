


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/models/now_playing_response.dart';
import 'package:movies/models/popular_response.dart';
import 'package:movies/models/tv_show_response.dart';

import '../models/movie.dart';
import '../models/movie_cast.dart';
import '../models/movie_cast_response.dart';
import '../models/popular_movie.dart';
import '../models/search_response.dart';
import '../models/tv_show.dart';
class MoviesProvider extends ChangeNotifier{

  String _baseURL = 'api.themoviedb.org';
  String _apiKey = 'e09310a3069d65877f66291ef374d7d1';
  String _language = 'en-US';


  List<Movie> onDisplayMovies = [];
  List<PopularMovie> onDisplayPopularMovies = [];
  List<TvShow> onDisplayPopularTvShows = [];
  List<Movie> searchMovies = [];

  int _page = 0;


  Map<int,List<Cast>> _movieCast = {};




  MoviesProvider(){
    print('Movies Provider initialized');
    getOnDisplayedMovies();
    getPopularMovies();
    //getPopularTVShows();
    getPopularTv();
  }


  Future<String> _getJasonData(String endpoint, [int page  = 1])async{
    var url = Uri.https(_baseURL,endpoint,{
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });

    var response = await http.get(url);

    return response.body;

  }




  getOnDisplayedMovies() async{
    print('getOnDisplayedMovies');

    final response = await _getJasonData('/3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(response);//.results;


    onDisplayMovies = nowPlayingResponse.results; //list of movies saved

    notifyListeners(); //notify the widgets that the data has changed

  }


  getPopularMovies() async {

    print('getPopularMovies');

    _page++;

    final response = await _getJasonData('/3/movie/popular',_page);
    final popularResponse = PopularMoviesResponse.fromJson(response);//.results;


    onDisplayPopularMovies = popularResponse.results; //list of movies saved

    notifyListeners(); //notify the widgets that the data has changed


  }

  getPopularTv() async {

    print('getPopularTv');

    _page++;

    final response = await _getJasonData('/3/tv/popular',_page);
    final popularResponse = PopularTvShowResponse.fromJson(response);//.results;


    onDisplayPopularTvShows = popularResponse.results; //list of movies saved

    notifyListeners(); //notify the widgets that the data has changed


  }

  Future<List<Cast>> getMovieCast(int movieID) async{


  if(_movieCast.containsKey(movieID)){
      return _movieCast[movieID]!;
  }

    //Revisar el mapa
    print('getMovieCast');

    final response = await _getJasonData('/3/movie/$movieID/credits');
    final movieCastResponse = MovieCastResponse.fromJson(response);//.results;

    _movieCast[movieID] = movieCastResponse.cast; //list of movies saved

    return movieCastResponse.cast;


  }


  Future<List<Movie>>searchMovie(String query) async{

    var url = Uri.https(_baseURL,'3/search/movie',{
      'api_key': _apiKey,
      'query': query,
    });

    print('searchMovie');

    var response = await http.get(url);

    final searchResponse = MovieAndTvSearchResponse.fromJson(response.body);


    return searchResponse.results;


  }








}




