import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:phone_store/api_folder/app_api.dart';
import 'dart:convert';

import 'package:phone_store/models/post.dart';

class ApiTest extends StatefulWidget {
  @override
  _ApiTestState createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {
  Api api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: <Widget>[
        FutureBuilder(
          future: api.fetchingPost(),
          builder: (context, AsyncSnapshot snapShot) {
            switch (snapShot.connectionState) {
              case ConnectionState.active:
               return  _loadingMethod();
              case ConnectionState.waiting:
                return _loadingMethod();
              case ConnectionState.none:
                return _failed();
              case ConnectionState.done:
                if (snapShot.hasData) {
               List<Post> posts=snapShot.data;
               Post post1=posts[0];
                  return Container(
                    padding: EdgeInsets.all(10),
                  //  child: Text(post1.userId.toString()),
                    child: Text(post1.body.toString()),

                  );
                }else{
                  return _noData();
                }
            }
            return Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.green,
              child: Text('Stop Here'),
            );
          },
        )
      ]),
    );
  }

  Widget _noData(){
    return Container(
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: Text(
        'We Cannot load your Data..Fix the Error'
      ),
    );
  }
  Widget _loadingMethod() {
    return Container(
      margin:EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: CircularProgressIndicator(backgroundColor: Colors.orange,),
    );

  }
  Widget _failed(){
    return Center(
      child: Container(
child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
        CircularProgressIndicator(backgroundColor: Colors.blue,),
  ],
),
      ),
    );
  }


}
