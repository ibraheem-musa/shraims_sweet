import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Galary extends StatelessWidget {
  const Galary({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: CarouselSlider(
        items: <Widget>[
          CardForGalary(
            image: 'lib/assets/HomescreenIcon/w.jpg',
            text: 'sweet',
          ),
          CardForGalary(
            image: 'lib/assets/HomescreenIcon/L.jpg',
            text: 'Lolipop',
          ),
          CardForGalary(
            image: 'lib/assets/HomescreenIcon/D.jpg',
            text: 'desserts',
          ),
          CardForGalary(
            image: 'lib/assets/HomescreenIcon/w.jpg',
            text: 'sweet',
          ),
        ],
        options: CarouselOptions(
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          


        ),
      ),
    );
  }
}

class CardForGalary extends StatelessWidget {
  String image;
  String text;
  CardForGalary({this.image, this.text});

  @override
  Widget build(BuildContext context) {
    // height: MediaQuery.of(context).size.height/3,
    //                    width: MediaQuery.of(context).size.width-50,
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width - 50,
      ),
    );

    // Card(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(8.0),
    //   ),
    //   color: Color(0xAABF942E),
    //   child: Container(
    //     height: MediaQuery.of(context).size.height/3,
    //     width: MediaQuery.of(context).size.width-50,
    //     child: Column(
    //       children: [
    //         Container(
    //           child: ClipRRect(
    //               borderRadius: BorderRadius.circular(8),
    //               child:
    //               ),
    //         ),

    //       ],
    //     ),
    //   ),
    // );
  }
}
