import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          CardForComingSoon(
            image: 'lib/assets/HomescreenIcon/D.jpg',
            text: 'desserts   ',
            subText: 'this offer just for two days',
          ),
          CardForComingSoon(
            image: 'lib/assets/HomescreenIcon/L.jpg',
            text: 'Lolipop   ',
            subText: 'this offer just for two days',
          ),
          CardForComingSoon(
            image: 'lib/assets/HomescreenIcon/w.jpg',
            text: 'sweet  ',
            subText: 'this offer just for two days',
          ),
          CardForComingSoon(
            image: 'lib/assets/HomescreenIcon/w.jpg',
            text: 'sweet  ',
            subText: 'this offer just for two days',
          ),
        ],
      ),
    );
  }
}

class CardForComingSoon extends StatelessWidget {
  String image;
  String text;
  String subText;
  CardForComingSoon({this.image, this.text, this.subText});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: Color(0xAABF942E),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.8,
        width: MediaQuery.of(context).size.width - 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width - 50,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Wrap(
                      children: [
                        Text(
                          subText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
