


import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier{

  MoviesProvider(){
    print('Movies Provider initialized');
    getOnDisplayedMovies();
  }


  getOnDisplayedMovies() async{
    print('getOnDisplayedMovies');
  }

}




