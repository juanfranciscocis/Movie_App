import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget{



  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size; //size of the screen

    return Container(
      width: double.infinity,//width of the screen
      height: 0.5 * size.height,//0.6 is the ratio of the screen height
      //color: Colors.red,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: 0.6 * size.width,
        itemHeight: 0.4 * size.height,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'details', arguments: 'movie-instace');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                  placeholder:  AssetImage('assets/no-image.jpg'),
                  image: NetworkImage('https://via.placeholder.com/300x400'),
                  fit: BoxFit.cover,
              ),
            ),
          );
        }

      ),
    );
  }
}