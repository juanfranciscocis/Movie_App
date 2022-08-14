import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget{
  const CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 0.6 * MediaQuery.of(context).size.height,
      color: Colors.red,
    );
  }
}