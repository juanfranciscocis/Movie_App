import 'package:flutter/material.dart';

import '../models/popular_movie.dart';

class MovieSlider extends StatelessWidget{

  //ATTRIBUTES
  final String seccionTitle;
  final List<PopularMovie> popularMovies;



  //CONSTRUCTOR
  const MovieSlider({Key? key, required this.seccionTitle, required this.popularMovies,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,//width of the screen
        height:250,
        //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:Text(seccionTitle,
              style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.bold,
              ),),
          ),
          
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularMovies.length,
                itemBuilder: (context,index){
                  return _MoviePoster(popularMovies: popularMovies,index: index);
                },
            ),
          )

        ]
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final List<PopularMovie> popularMovies;
  final int index;
  const _MoviePoster({
    Key? key, required this.popularMovies, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final movie = popularMovies[index];


    return Container(
      width: 130,
      height: 190,
      //color:Colors.green,
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Column(
        children:[

          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'details', arguments: 'movie-instace');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.getFullUrl()),
                  fit: BoxFit.cover,
                  width :130,
                  height: 180,


              ),
            ),
          ),

          SizedBox(height: 2),

          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,

          ),






        ]
      ),
    );
  }
}