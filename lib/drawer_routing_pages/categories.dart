import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "الاقسام",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          children: <Widget>[
            _buildSingleCategoryCard('images/phone1.png', 'Iphone', () {
              Navigator.of(context).pushNamed('iphone');
            }),
            _buildSingleCategoryCard('images/phone2.png', 'Samsung', () {
              Navigator.of(context).pushNamed('samsung');
            }),
            _buildSingleCategoryCard('images/phone3.png', 'Redmi', () {
              Navigator.of(context).pushNamed('samsung');
            }),
            _buildSingleCategoryCard('images/phone4.png', 'Nokia', () {
              Navigator.of(context).pushNamed('nokia');
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleCategoryCard(
      String image, String brand, Function onDoubleTapFunction) {
    return InkWell(
      onDoubleTap: onDoubleTapFunction,
      child: Card(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage(image), fit: BoxFit.cover)),
                )),
            Text(brand),
          ],
        ),
      ),
    );
  }
}
