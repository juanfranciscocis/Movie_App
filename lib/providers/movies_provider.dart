


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/models/now_playing_response.dart';
import 'package:movies/models/popular_response.dart';
import 'package:movies/models/tv_show_response.dart';

import '../models/movie.dart';
import '../models/popular_movie.dart';
import '../models/tv_show.dart';
class MoviesProvider extends ChangeNotifier{

  String _baseURL = 'api.themoviedb.org';
  String _apiKey = 'e09310a3069d65877f66291ef374d7d1';
  String _language = 'en-US';


  List<Movie> onDisplayMovies = [];
  List<PopularMovie> onDisplayPopularMovies = [];
  List<TvShow> onDisplayPopularTvShows = [];




  MoviesProvider(){
    print('Movies Provider initialized');
    getOnDisplayedMovies();
    getPopularMovies();
    //getPopularTVShows();
    getPopularTv();
  }

  getOnDisplayedMovies() async{
    print('getOnDisplayedMovies');

    var url = Uri.https(_baseURL,'3/movie/now_playing',{
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });


    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);//.results;


    onDisplayMovies = nowPlayingResponse.results; //list of movies saved

    notifyListeners(); //notify the widgets that the data has changed

  }


  getPopularMovies() async {

    print('getPopularMovies');

    var url = Uri.https(_baseURL,'3/movie/popular',{
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });


    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    final popularResponse = PopularMoviesResponse.fromJson(response.body);//.results;


    onDisplayPopularMovies = popularResponse.results; //list of movies saved

    notifyListeners(); //notify the widgets that the data has changed





  }

  getPopularTv() async {

    print('getPopularTv');

    var url = Uri.https(_baseURL,'3/tv/popular',{
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });


    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    final popularResponse = PopularTvShowResponse.fromJson(response.body);//.results;


    onDisplayPopularTvShows = popularResponse.results; //list of movies saved

    notifyListeners(); //notify the widgets that the data has changed





  }








}




