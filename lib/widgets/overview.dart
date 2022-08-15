import 'package:flutter/material.dart';
class Overview extends StatelessWidget{
  const Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Text('Sanctus neque maiorum postea nostrum. Conclusionemque commodo id efficitur no electram definitiones delenit. Dolore massa hinc omittantur qui blandit dis. Sadipscing aptent an mazim nec invenire dicunt sodales orci. Omittantur nulla pro porro vel. Deterruisset viderer iisque aperiri taciti mnesarchum verear ceteros. Movet ultricies atomorum efficitur elit solet. Cras porttitor leo an quas referrentur pri. Electram consul mei hac simul duo maximus sale.',
        style: TextStyle(
          fontSize: 17,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
