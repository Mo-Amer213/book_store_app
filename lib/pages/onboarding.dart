import 'package:flutter/material.dart';
import 'package:phone_store/pages/first_home.dart';
import 'package:shared_preferences/shared_preferences.dart';
class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  choosingCountry(String country) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
//setting some variables Strings variables
    pref.setString("country", country);
    print(pref.getString("country"));
  }

  decideFirstPage()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    var country=pref.getString('country');
    Navigator.pop(context);
    if(country != null){
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context){
          return UserAccountDrawer();
        }
      ));

    }
  }

  @override
  void initState() {
    decideFirstPage();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Choose your Country"),
      ),
      body: ListView(
        children:<Widget>[
          ListTile(
            onTap: (){
              choosingCountry('Egypt');
              decideFirstPage();
            },
            title: Text("Egypt"),
            trailing: Image.asset('images/amer.png'),
          ),

        ]
      ),
    );
  }
}
