import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:phone_store/api_folder/app_api.dart';
import 'package:phone_store/drawer_routing_pages/categories.dart';
import 'package:phone_store/models/comment.dart';
import '../app_drawer/book_store_drawer.dart';
import 'package:phone_store/pages/home_page.dart';
import 'package:phone_store/search/advanced_search.dart';
import 'package:phone_store/models/post.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'choosing_country.dart';

class UserAccountDrawer extends StatefulWidget {
  @override
  _UserAccountDrawerState createState() => _UserAccountDrawerState();
}

class _UserAccountDrawerState extends State<UserAccountDrawer> {
/*
* for making us sure about sharedPreferences variables we can
* invoke the getPref Method from choosing_country file .... let's do this...But wait a second
* we can not invoke async Methods by taking object from classes...don't forget that ua_amer*/
  Api api=Api();
  final myStyle =
      TextStyle(color: Color(0xff2C343D), fontWeight: FontWeight.bold);

  //final myStyle = TextStyle(color: Color(0xff4E7F09));

  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
     pref.setString('country','Egypt');
   print(pref.getString('country'));
  }

  void initState(){
   getPref();
  super.initState();
}

  @override
  Widget build(BuildContext context)  {
    var amer= api.getCommentRow();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          drawer: BookStoreDrawer(),
          appBar: AppBar(
            title: Text(
              "Home",
            ),
            centerTitle: true,
            backgroundColor: Colors.red.shade900,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                showSearch(context: context, delegate: AdvancedSearch());
                },
              ),
            ],
          ),
          body: HomePage(),
        ));
  }

  IconButton _buildNormalBadSearch(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                //backgroundColor: Colors.orange,
                elevation: 5,
                title: Text('Searching'),
                content: Container(
                  height: 30,
                  child: TextFormField(),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Search'),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Categories();
                      }));
                    },
                  ),
                  FlatButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
      },
    );
  }
}
