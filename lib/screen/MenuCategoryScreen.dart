import 'package:first_app_for_test/applocal.dart';
import 'package:first_app_for_test/main.dart';
import 'package:first_app_for_test/model/MenuProduct.dart';
import 'package:first_app_for_test/provider/MenuCategoryprovider.dart';
import 'package:first_app_for_test/provider/MenuSubCategoryprovider.dart';

import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
class MenuCategoryForsupCategory extends StatefulWidget {
  const MenuCategoryForsupCategory({key}) : super(key: key);

  @override
  _MenuCategoryForsupCategoryState createState() =>
      _MenuCategoryForsupCategoryState();
}

class _MenuCategoryForsupCategoryState extends State<MenuCategoryForsupCategory> {
  
  @override
  Widget build(BuildContext context) {
  var idForcat;
     idForcat= ModalRoute.of(context).settings.arguments as int;

    // MenuCategoryProvider menuCategoryProvider =
    //     Provider.of<MenuCategoryProvider>(context, listen: false);

    MenuProductProvider menuProductProvider =
        Provider.of<MenuProductProvider>(context, listen: false);

        List<MenuProduct> filtercatgory;

        
      filtercatgory = menuProductProvider.menuProduct.where((elemnt2) {
        return elemnt2.idCategory==idForcat;
      }).toList();

    return  Scaffold(
      appBar: AppBar(title: Text('Menu'),centerTitle: true,backgroundColor:Color(0xffBF942E) ,),
      body: Container(
          color: Color(0xffBF942E),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
               
                Expanded(
                  child: ListView.builder(
                    itemCount:  filtercatgory.length,
                    itemBuilder: (_, i) {
                    return GestureDetector(
                      onTap: (){
                           Navigator.pushNamed(context,nameroute.nameRouote_ProductDetails  );
       

                      },
                      child: CardForsubcatogry(
                        image: filtercatgory[i].logoimage,
                        price:  filtercatgory[i].price,
                        textforname:  filtercatgory[i].name,
                        
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
    );
  }
}

class CardForsubcatogry extends StatelessWidget {
  String image;
  String textforname;
  int price;
  CardForsubcatogry({this.image, this.textforname, this.price});

  @override
  Widget build(BuildContext context) {
    return  Center(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                      color: Colors.amber[200],
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
              height: MediaQuery.of(context).size.height /6,
              width: MediaQuery.of(context).size.width ,
                           
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Image.asset(
                        image,
                        height: MediaQuery.of(context).size.height/5,
                        width: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Wrap(
                            children: [
                              Text(
                                textforname,
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          Text(
                            price.toString()+' \$',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              
            ),
          ),
        );
  }
}
