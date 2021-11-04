import 'package:flutter/material.dart';

class TextForTitle extends StatelessWidget {
  String text;
  String image;
  TextForTitle({this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 10, 3, 8),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                  height: 30,
                  width: 30,
                ),
                Expanded(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xffbf942e),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 0,
              color: Color(0xffbf942e),
              thickness: 1,
              indent: 5,
              endIndent: 10,
            ),
          ],
        ));
  }
}
