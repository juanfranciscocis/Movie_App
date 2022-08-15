import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);//get the provider instance

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies App'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: (){},
          ),
        ],
      ),

      


      body: SingleChildScrollView(
        child: Column(
          children:[
          //Card Swiper
            CardSwiper(movies: moviesProvider.onDisplayMovies),

          //Horizontal List of movies
            MovieSlider(seccionTitle: 'Popular Movies', movieOrTv: moviesProvider.onDisplayPopularMovies),
            MovieSlider(seccionTitle: 'Popular TV Shows',movieOrTv: moviesProvider.onDisplayPopularTvShows),



          ],





        ),
      )
    );
  }
}