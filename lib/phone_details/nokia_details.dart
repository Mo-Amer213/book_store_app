import 'package:flutter/material.dart';
import 'package:phone_store/all_app_json_data/json_nokiaData.dart';

class NokiaDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "NokiaDetails",
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          body: ListView(
            children: <Widget>[
              _buildGridTilePhoneImage(context),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    children:<Widget>[
                      _buildSingleDetailContainer(context, Colors.deepPurple,"الاسم",'name'),
                      _buildSingleDetailContainer(context, Colors.white,"الكاميرا",'camera'),
                      _buildSingleDetailContainer(context, Colors.deepPurple,"الوزن",'weight'),
                      _buildSingleDetailContainer(context, Colors.white,"العالج",'cpu'),
                      _buildSingleDetailContainer(context, Colors.deepPurple,"الرام",'ram'),
                      _buildSingleDetailContainer(context, Colors.white,"المساحة",'storage'),
                      _buildSingleDetailContainer(context, Colors.deepPurple,"البطارية",'battery'),
                    ]),
              ),

            ],
          )),
    );
  }

  Container _buildSingleDetailContainer(BuildContext context,
      Color color,
      String property,
      String description) {
    return Container(
      // margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        color: color,
        width: MediaQuery.of(context).size.width,
        // height: 80,
        child: RichText(
          text: TextSpan(
              style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w100),
              children: [
                TextSpan(text: ' $property : ${Data().allPhoneDetails[0]['forthPhone'][description]}'),
              ]),
        ));
  }

  Widget _buildGridTilePhoneImage(context) {
    return GridTile(
      child: Container(
        height: MediaQuery.of(context).size.width * 0.75,
        // width: MediaQuery.of(context).size.width ,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage('images/phone3.png'), fit: BoxFit.cover),
        ),
      ),
    );
  }



}
