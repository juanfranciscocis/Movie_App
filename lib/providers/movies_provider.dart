


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/models/now_playing_response.dart';

import '../models/movie.dart';
class MoviesProvider extends ChangeNotifier{

  String _baseURL = 'api.themoviedb.org';
  String _apiKey = 'e09310a3069d65877f66291ef374d7d1';
  String _language = 'en-US';


  List<Movie> onDisplayMovies = [];




  MoviesProvider(){
    print('Movies Provider initialized');
    getOnDisplayedMovies();
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

}




