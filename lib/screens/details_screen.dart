import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final String movieName = ModalRoute.of(context)?.settings.arguments.toString() ??  'no-movie';



    return  Scaffold(
        body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
        ],
      )
    );
  }
}


class _CustomAppBar extends StatelessWidget{

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
