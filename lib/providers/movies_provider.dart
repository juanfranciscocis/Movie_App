


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

  int _page = 0;




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








}




