import 'package:first_app_for_test/Colors.dart';
import 'package:first_app_for_test/widget/Drawer_widget.dart';
import 'package:first_app_for_test/widget/NavigationBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorForDesign().black,
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              //-----------item-----------------------
              Container(
                height: 2 * 170.0,
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (_, i) {
                      return cartitem(
                        image:
                            "https://egyptbesttrip.com/3abar-data/uploads/2018/07/IMG-20200719-WA0054.jpg",
                        price: 100,
                        textforname: "dsert",
                      );
                    }),
              ),
              //-----------add Note-----------------------
              Divider(
                color: ColorForDesign().Gold,
                endIndent: 10,
                height: 20,
                indent: 10,
                thickness: 1,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.chat_rounded,
                            color: ColorForDesign().Gold,
                          ),
                          Text(
                            "  Add a Note",
                            style: TextStyle(color: ColorForDesign().Gold),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          style: TextStyle(color: ColorForDesign().Gold),
                          cursorColor: ColorForDesign().Gold,
                          decoration: InputDecoration(
                              hintText: 'Enter your note',
                              hintStyle:
                                  TextStyle(color: ColorForDesign().Gold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //-----------total price-----------------------
              Divider(
                color: ColorForDesign().Gold,
                endIndent: 10,
                height: 20,
                indent: 10,
                thickness: 1,
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: PaymentPart(
                  textForservice: 2.0,
                  textForsuptotal: 1.5,
                  textForTotalPrice: 2.0 + 1.5,
                ),
              ),
              //-----------button to conferm-----------------------
              Divider(
                color: ColorForDesign().Gold,
                endIndent: 10,
                height: 20,
                indent: 10,
                thickness: 1,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      primary: ColorForDesign().Gold,
                      backgroundColor: ColorForDesign().Gold,
                      fixedSize:
                          Size(MediaQuery.of(context).size.width - 40, 40)),
                  onPressed: () {},
                  child: Text("conferm the order",
                      style: TextStyle(
                          fontSize: 20, color: ColorForDesign().black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class cartitem extends StatefulWidget {
  String textforname;
  int price;
  String image;
  cartitem({this.textforname, this.image, this.price});

  @override
  _cartitemState createState() => _cartitemState();
}

class _cartitemState extends State<cartitem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Color(0x30bf942e),
            border: Border.all(color: ColorForDesign().Gold, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
            ]),
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 5, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Wrap(
                          children: [
                            RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: widget.textforname,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: ColorForDesign().Gold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ' \$ ' + widget.price.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: ColorForDesign().Gold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Image.network(
                    widget.image,
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 3,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class PaymentPart extends StatelessWidget {
  double textForsuptotal;
  double textForservice;
  double textForTotalPrice;
  PaymentPart({
    this.textForTotalPrice,
    this.textForservice,
    this.textForsuptotal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "payment summery",
              style: TextStyle(color: ColorForDesign().Gold, fontSize: 30),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Suptotal",
                style: TextStyle(color: ColorForDesign().Gold, fontSize: 25),
              ),
              Text(
                textForsuptotal.toString(),
                style: TextStyle(color: ColorForDesign().Gold, fontSize: 25),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Service",
                style: TextStyle(color: ColorForDesign().Gold, fontSize: 25),
              ),
              Text(
                textForservice.toString(),
                style: TextStyle(color: ColorForDesign().Gold, fontSize: 25),
              )
            ],
          ),
          Divider(
            color: Colors.white,
            endIndent: 5,
            height: 2,
            indent: 5,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Totale",
                  style: TextStyle(color: ColorForDesign().Gold, fontSize: 25),
                ),
                Text(
                  textForTotalPrice.toString(),
                  style: TextStyle(color: ColorForDesign().Gold, fontSize: 25),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
