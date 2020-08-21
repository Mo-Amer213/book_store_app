import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:phone_store/api_folder/app_api.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  Api api=Api();
  @override
  Widget build(BuildContext context) {
   //api.getCommentRow();
   api.getCommentNames();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: ListView(children: <Widget>[
          _usingCarousel(),
          Container(
            child: Text("الاقسام"),
          ),
          Container(
              height: 100,
              child: Card(
                elevation: 5,
                shadowColor: Colors.deepOrange,
                //shadowColor: Colors.red.shade900,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _buildSingleListItem('images/phone1.png', "Samsung"),
                    _buildSingleListItem('images/phone2.png', "Apple"),
                    _buildSingleListItem('images/phone3.png', "Redmi"),
                    _buildSingleListItem('images/phone4.png', "OPPO"),
                    _buildSingleListItem('images/phone5.png', "NOKIA"),
                  ],
                ),
              )),
          Container(
            child: Text("التصنيفات"),
          ),
          Card(
            shadowColor: Colors.deepOrange,
            child: Container(
              padding: EdgeInsets.all(8),
              height: MediaQuery.of(context).size.width * 0.75,
              child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: <Widget>[
                    _buildGridTile('images/phone1.png', 'Iphone'),
                    _buildGridTile('images/phone2.png', 'Samsung'),
                    _buildGridTile('images/phone3.png', 'Redmi'),
                    _buildGridTile('images/phone4.png', 'Nokia'),
                    _buildGridTile('images/phone3.png', 'Redmi'),
                    _buildGridTile('images/phone4.png', 'Nokia'),
                  ]),
            ),
          )
        ]),
      ),
    );
  }

  GridTile _buildGridTile(String image, String title) {
    return GridTile(
      footer: Text(
        title,
        style: TextStyle(
          color: Colors.red.shade900,
        ),
        textAlign: TextAlign.center,
      ),
      child: Container(
        height: 100,
        width: 100,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container _buildSingleListItem(String image, String name) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
      ),
      height: 200,
      width: 200,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('categories');
        },
        child: ListTile(
          title: Image.asset(
            image,
            fit: BoxFit.fill,
          ),
          subtitle: Text(
            name,
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }

  CarouselSlider _usingCarouselSlider() {
    return CarouselSlider(
      items: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: ExactAssetImage('images/long_way.png'),
            fit: BoxFit.cover,
          )),
        ),
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: ExactAssetImage('images/amer.png'),
            fit: BoxFit.cover,
          )),
        ),
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: ExactAssetImage('images/bg.png'),
            fit: BoxFit.cover,
          )),
        ),
      ],
      options: CarouselOptions(
        height: 200,
        aspectRatio: 18 / 9,
        viewportFraction: 0.8,
        initialPage: 1,
        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        autoPlayAnimationDuration: Duration(minutes: 2),
        autoPlayCurve: Curves.easeInCubic,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        pauseAutoPlayOnManualNavigate: true,
      ),
    );
  }

  SizedBox _usingCarousel() {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Carousel(
        images: [
          AssetImage('images/amer.png'),
          ExactAssetImage('images/photo.png'),
          ExactAssetImage('images/long_way.png'),
        ],
        animationCurve: Curves.decelerate,
        dotIncreasedColor: Colors.deepOrange,
        dotBgColor: Colors.transparent,
        showIndicator: true,
        boxFit: BoxFit.cover,
        borderRadius: false,
        radius: Radius.circular(20),
        dotPosition: DotPosition.bottomCenter,
        overlayShadow: true,
        autoplay: false,
        autoplayDuration: Duration(minutes: 20),
        animationDuration: Duration(seconds: 1),
        defaultImage: Image,
      ),
    );
  }

  Widget _buildCarouselContainer() {
    return Container(
        child: CarouselSlider(
      items: <Widget>[
        Container(child: Text("Amer")),
        Container(child: Text("Amer")),
        Container(child: Text("Amer")),
      ],
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        autoPlayAnimationDuration: Duration(milliseconds: 200),
        reverse: true,
        initialPage: 0,
        autoPlayInterval: Duration(seconds: 2),
        autoPlayCurve: Curves.bounceOut,
        enlargeCenterPage: true,
        pauseAutoPlayOnManualNavigate: true,
      ),
    ));
  }
}
