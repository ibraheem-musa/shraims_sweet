import 'dart:developer';

import 'package:first_app_for_test/provider/MenuSubCategoryprovider.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({ key }) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: true,
          toolbarHeight: 150,
          title: Text(" sliver"),)
          ,
         SliverList(
           
           delegate: SliverChildBuilderDelegate(
            
             (context, index){
               
                
           return    
           Container(
             height: 70,
             child: Center(child: Text(MenuProductProvider().menuProduct[index].name),),           )
           ;
         }
         
         
          )
         )
      ],
    );
  }
}