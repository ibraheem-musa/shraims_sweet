import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class Specialtoday extends StatelessWidget {
  const Specialtoday({  key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     SizedBox(
  height: MediaQuery.of(context).size.height/2.5,
  width: double.infinity,
  child: 
  Carousel(
    images: [
      Image.asset('lib/assets/HomescreenIcon/w.jpg',fit: BoxFit.cover,),
     
      Image.asset('lib/assets/HomescreenIcon/L.jpg',fit: BoxFit.cover,),

      Image.asset('lib/assets/HomescreenIcon/D.jpg',fit: BoxFit.cover,)
    ],
    
       dotSize: 4.0,
      dotSpacing: 15.0,
      dotColor: Color(0xAA222222),
      indicatorBgPadding: 5.0,
      dotBgColor: Color(0xAAbf942e,),
      
      moveIndicatorFromBottom: 120.0,
      showIndicator :true,
      noRadiusForIndicator: true,
           animationCurve: Curves.easeInOut,
       animationDuration: Duration(milliseconds: 1000),
  )
)
;
  }
}