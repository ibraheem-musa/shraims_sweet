import 'package:flutter/material.dart';

class HappyCustomers extends StatelessWidget {
  const HappyCustomers({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          CardForHappyCustomers(image: 'lib/assets/HomescreenIcon/w.jpg',text: 'sweet',),
           CardForHappyCustomers(image: 'lib/assets/HomescreenIcon/L.jpg',text: 'Lolipop',),
            CardForHappyCustomers(image: 'lib/assets/HomescreenIcon/D.jpg',text: 'desserts',),
             CardForHappyCustomers(image: 'lib/assets/HomescreenIcon/w.jpg',text: 'sweet',),
              
        ],
      ),
    );
  }
}

class CardForHappyCustomers extends StatelessWidget {
  String image;
  String text;
  CardForHappyCustomers({this.image, this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: Color(0xAABF942E),
      child: Container(
        height: MediaQuery.of(context).size.height/3,
        width: MediaQuery.of(context).size.height/2.5,
        child: Column(
          children: [
            Container(height: MediaQuery.of(context).size.height/4,width: MediaQuery.of(context).size.height/2.5,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
