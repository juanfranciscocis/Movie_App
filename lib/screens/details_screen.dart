import 'package:flutter/material.dart';
import 'package:movies/widgets/widgets.dart';

import '../models/movie.dart';

class DetailsScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final dynamic movieOrTv = ModalRoute.of(context)!.settings.arguments ;
    print(movieOrTv.title);




    return  Scaffold(
        body: CustomScrollView(
        slivers: [
          CustomAppBar(movieOrTv: movieOrTv),
          SliverList(
              delegate: SliverChildListDelegate([
                PosterAndTitle(movieOrTv: movieOrTv,),
                Overview(movieOrTv: movieOrTv,),
                Overview(movieOrTv: movieOrTv,),
                Overview(movieOrTv: movieOrTv,),
                Overview(movieOrTv: movieOrTv,),
                CastingCards(),

              ])
          )
        ],
      )
    );
  }
}






class CastingCards extends StatelessWidget{
  const CastingCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 200,
      //color: Colors.red,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context,index){
        return _CastCard();
      }),
    );
  }
}


class _CastCard extends StatelessWidget{
  const _CastCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      //color: Colors.green,
      child: Column(
        children:[
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: FadeInImage(
                placeholder:  AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg'),
                fit: BoxFit.cover,
            ),
            ),
          SizedBox(height: 5),
          Text('Cast Name',maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)

        ],
      ),
    );


  }
}




class CustomAppBar extends StatelessWidget{

  final dynamic movieOrTv;

  const CustomAppBar({Key? key, required this.movieOrTv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar( //SliverAppBar is a widget that can be used to display a flexible app bar that can be scrolled away from its pinned position.
      backgroundColor: Colors.orangeAccent,
      expandedHeight: 250,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(bottom: 20),
          //color:Colors.black12,
          child: Text(
            movieOrTv.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        background: FadeInImage(
          fit: BoxFit.cover,
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(movieOrTv.getFullUrlBackdrop()),
        ),
      ),

    );
  }
}




class PosterAndTitle extends StatelessWidget{
  final dynamic movieOrTv;
  const PosterAndTitle({Key? key, required this.movieOrTv}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Flexible(
      child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child:Row(
            children: [
              ClipRRect(
                borderRadius:BorderRadius.circular(10),
                child:FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movieOrTv.getFullUrl()),
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(width: 20),

              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movieOrTv.title,style:textTheme.headline5, overflow: TextOverflow.ellipsis),
                    Text(movieOrTv.originalTitle,style:textTheme.subtitle1, overflow: TextOverflow.ellipsis),

                    Row(
                      children:[
                        Icon(Icons.star,color: Colors.yellow,size: 20,),
                        SizedBox(width: 5),
                        Text(movieOrTv.voteAverage.toString(),style:textTheme.caption,),
                      ],
                    )


                  ],
                ),
              )


            ],
          )
      ),
    );
  }
}


















