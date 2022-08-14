import 'package:flutter/material.dart';
import 'package:movies/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final String movieName = ModalRoute.of(context)?.settings.arguments.toString() ??  'no-movie';




    return  Scaffold(
        body: CustomScrollView(
        slivers: [
          CustomAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
                PosterAndTitle(),
                Overview(),
                Overview(),
                Overview(),
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
      width: double.infinity,
      height: 200,
      color: Colors.red,
    );
  }
}



class CustomAppBar extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return SliverAppBar( //SliverAppBar is a widget that can be used to display a flexible app bar that can be scrolled away from its pinned position.
      backgroundColor: Colors.indigo,
      expandedHeight: 250,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color:Colors.black12,
          child: Text(
            'Movie Name',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        background: FadeInImage(
          fit: BoxFit.cover,
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/300x400'),
        ),
      ),

    );
  }
}




class PosterAndTitle extends StatelessWidget{
  const PosterAndTitle({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child:Row(
          children: [
            ClipRRect(
              borderRadius:BorderRadius.circular(10),
              child:FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/200x300'),
                height: 150,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(width: 20),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Movie Title',style:textTheme.headline5, overflow: TextOverflow.ellipsis,maxLines: 2,),
                Text('Original Title',style:textTheme.subtitle1, overflow: TextOverflow.ellipsis,maxLines: 2,),

                Row(
                  children:[
                    Icon(Icons.star,color: Colors.yellow,size: 20,),
                    SizedBox(width: 5),
                    Text('MOVIE VOTE AVERAGE',style:textTheme.caption,),
                  ],
                )


              ],
            )


          ],
        )
    );
  }
}


















