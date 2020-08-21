import 'package:flutter/material.dart';
import 'package:phone_store/pages/first_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChoosingCountry extends StatefulWidget {
  @override
  _ChoosingCountryState createState() => _ChoosingCountryState();
}

class _ChoosingCountryState extends State<ChoosingCountry> {
  savePref(String country) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('country', country);
    print(pref.getString('country'));
  }

  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var country = pref.getString('country');
    if (country != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return UserAccountDrawer();
      }));
    }
  }
@override
void initState(){
    getPref();
  super.initState();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("choose your country ua_amer"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            onTap: () {
              savePref('Egypt');
            },
            title: Text("Egypt"),
            trailing: Image.asset('images/long_way.png'),
          ),
          ListTile(
            onTap: () {
              savePref('Sudia Arabia');
            },
            title: Text("Sudia Arabia"),
            trailing: Image.asset('images/bg.png'),
          ),
        ],
      ),
    );
  }
}
