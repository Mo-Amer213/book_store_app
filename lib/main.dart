import 'package:flutter/material.dart';
import 'package:phone_store/drawer_routing_pages/advanced_login_two.dart';
import './drawer_routing_pages/default_login.dart';
import './drawer_routing_pages/default_login.dart';
import './drawer_routing_pages/default_login.dart';
import './api_folder/app_api.dart';
import './drawer_routing_pages/api_test.dart';
import './drawer_routing_pages/login.dart';
import './pages/home_page.dart';
import './phone_details/iphone_details.dart';
import './phone_details/nokia_details.dart';
import './phone_types/iphone.dart';
import './phone_types/nokia.dart';
import 'pages/first_home.dart';
import './drawer_routing_pages/categories.dart';
import './drawer_routing_pages/about_us.dart';
import './drawer_routing_pages/settings.dart';
import './drawer_routing_pages/sign_out.dart';
import './utilities.dart';
import './phone_types/samsung.dart';
import './phone_details/samsung_details.dart';
import './pages/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './pages/choosing_country.dart';
import './drawer_routing_pages/advanced_login.dart';
void main() {
  runApp(PhoneStore());
}

class PhoneStore extends StatelessWidget {
  OnBoarding onBoarding =OnBoarding();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'home_page':(context){return UserAccountDrawer();} ,
        'home':(context){return HomePage();} ,
        'categories':(context){return Categories();} ,
        'aboutUs':(context){return AboutUs();}   ,
        'settings':(context){return Settings();} ,
        'signOut':(context){return SignOut();  } ,
        'samsung':(context){return Samsung();} ,
        'iphone':(context){return Iphone();} ,
        'nokia':(context){return Nokia();},
        'samsung_details':(context){return SamsungDetails();},
        'nokia_details':(context){return NokiaDetails();},
        'iphone_details':(context){return IphoneDetails();},
        'login':(context){return AdvancedLoginTwo();},
        'api_call':(context){return ApiTest();},

      } ,
      theme:ThemeData(primarySwatch: Colors.red,fontFamily: 'Ubuntu'),
      //home: UserAccountDrawer(),
    home: ChoosingCountry(),
    );
  }
}
