import 'package:flutter/material.dart';
class Overview extends StatelessWidget{
  const Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Text('alkjsdkjlklajskjldkaskjdjkl kjlaskd sakjljkdkljasjkdk jkas dkjas dkjkasjkd kasjkldjkakskd ks akdkkjaskd kask djkkas',
        style: TextStyle(
          fontSize: 17,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
