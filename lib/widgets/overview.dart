import 'package:flutter/material.dart';
class Overview extends StatelessWidget{


  final dynamic movieOrTv;

  const Overview({Key? key, required this.movieOrTv}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Text(movieOrTv.overview,
        style: TextStyle(
          fontSize: 17,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
