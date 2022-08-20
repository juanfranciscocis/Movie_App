import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../models/movie.dart';

class CardSwiper extends StatelessWidget{

  final List<Movie> movies;

  const CardSwiper({required this.movies});



  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size; //size of the screen


    if(movies.length == 0){
      return Container(
        width: double.infinity,
        height: 0.5 * size.height,//0.6 is the ratio of the screen height
        child:Center(
          child:CircularProgressIndicator(),
        )

      );
    }






    return Container(
      width: double.infinity,//width of the screen
      height: 0.5 * size.height,//0.6 is the ratio of the screen height
      //color: Colors.red,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: 0.6 * size.width,
        itemHeight: 0.4 * size.height,
        itemBuilder: (BuildContext context, int index){

          final movie = movies[index];
          print(movie.getFullUrl());

          return GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'details', arguments: movie);
            },
            child: Hero(
              tag: movie.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                    placeholder:  AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(movies[index].getFullUrl()),
                    fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }

      ),
    );
  }
}