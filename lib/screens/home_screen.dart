import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children:[
        //Card Swiper
        CardSwiper(),

        //Horizontal List of movies


        ],





      )
    );
  }
}