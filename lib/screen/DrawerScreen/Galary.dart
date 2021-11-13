import 'package:first_app_for_test/Colors.dart';
import 'package:first_app_for_test/applocal.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Galary extends StatefulWidget {
  const Galary({key}) : super(key: key);

  @override
  State<Galary> createState() => _GalaryState();
}

class _GalaryState extends State<Galary> {
  List ImagesForShow = [
    "https://restaurants-static.skipthedishes.com/images/resized/item-860ff6ac745d986d5b99.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLz8JzuwDOVUL1hqjew5BHmb5rFR-yCaiMLg&usqp=CAU",
    "https://d1ralsognjng37.cloudfront.net/200c6896-2c65-4f23-b12a-4a426a9e000e.jpeg",
    "https://img.cdn4dd.com/cdn-cgi/image/fit=cover,width=1200,height=1200,format=jpeg,quality=50/https://doordash-static.s3.amazonaws.com/media/photos/3b8e6472-9525-4f08-aa22-e9e5f1b6676b-retina-large-jpeg",
    "https://restaurants-static.skipthedishes.com/images/resized/item-860ff6ac745d986d5b99.jpg",
    "https://img.cdn4dd.com/cdn-cgi/image/fit=cover,width=1200,height=1200,format=jpeg,quality=50/https://doordash-static.s3.amazonaws.com/media/photos/3b8e6472-9525-4f08-aa22-e9e5f1b6676b-retina-large-jpeg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLz8JzuwDOVUL1hqjew5BHmb5rFR-yCaiMLg&usqp=CAU",
    "https://d1ralsognjng37.cloudfront.net/200c6896-2c65-4f23-b12a-4a426a9e000e.jpeg",
    "https://img.cdn4dd.com/cdn-cgi/image/fit=cover,width=1200,height=1200,format=jpeg,quality=50/https://doordash-static.s3.amazonaws.com/media/photos/3b8e6472-9525-4f08-aa22-e9e5f1b6676b-retina-large-jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorForDesign().black,
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context).translate('gallery'),
            style: TextStyle(color: ColorForDesign().Gold),
          ),
          backgroundColor: ColorForDesign().black),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 18),
          child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              itemCount: ImagesForShow.length,
              itemBuilder: (_, index) {
                return Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.network(
                      ImagesForShow[index],
                      fit: BoxFit.cover,
                    ));
              },
              staggeredTileBuilder: (index) {
                return new StaggeredTile.count(1, index.isEven ? 1.2 : 2);
              }),
        ),
      ),
    );
  }
}
