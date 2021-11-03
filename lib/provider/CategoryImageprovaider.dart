import 'package:first_app_for_test/model/catgorymodel.dart';
import 'package:flutter/cupertino.dart';

class CategoryImageprocaider with ChangeNotifier {
  List<CategoryImage> categoryImage = [
    CategoryImage(
        image: 'lib/assets/HomescreenIcon/speciality_icon.png',
        logoImage: 'lib/assets/HomescreenIcon/icon-01.jpg'),
    CategoryImage(
        image: 'lib/assets/HomescreenIcon/speciality_icon.png',
        logoImage: 'lib/assets/HomescreenIcon/icon-01.jpg'),
    CategoryImage(
        image: 'lib/assets/HomescreenIcon/desert_icon.png',
        logoImage: 'lib/assets/HomescreenIcon/icon-02.jpg'),
    CategoryImage(
        image: 'lib/assets/HomescreenIcon/drink_icon.png',
        logoImage: 'lib/assets/HomescreenIcon/icon-03.jpg'),
    CategoryImage(
        image: 'lib/assets/HomescreenIcon/snacks_icon.png',
        logoImage: 'lib/assets/HomescreenIcon/icon-04.jpg'),
    CategoryImage(
        image: 'lib/assets/HomescreenIcon/family_plates_icon.png',
        logoImage: 'lib/assets/HomescreenIcon/icon-05.jpg'),
  ];
}
