import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdvancedLogin extends StatefulWidget {
  @override
  _AdvancedLoginState createState() => _AdvancedLoginState();
}

class _AdvancedLoginState extends State<AdvancedLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
//            color: Color(0xffEE5A6C),
            color: Color(0xff4E7F09),
          ),
          Transform.scale(
            scale: 1.3,
            child: Transform.translate(
              offset: Offset(0, -400),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width)),
                width: double.infinity,
                height: double.infinity,
                child: Text(
                  'amer',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(-200, 50),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red.shade900.withOpacity(0.5),
                  //borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/2)
                  //borderRadius: BorderRadius.all(Radius.circular(100)),
                  shape: BoxShape.circle),
            ),
          ),
          Transform.translate(
            offset: Offset(100, 150),
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                color: Colors.blue[200].withOpacity(0.75),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Transform.translate(
                  offset: Offset(0,-80),
                  child: Container(
                    child: Text('Login Page',style: TextStyle(color: Colors.redAccent,fontSize:24),),
                  ),
                ),
                _buildTextFormField('Enter your name'),
                SizedBox(
                  height: 10,
                ),
                _buildTextFormField('Enter your email'),
                SizedBox(
                  height: 10,
                ),
                _buildTextFormField('Enter your password'),
                SizedBox(
                  height: 10,
                ),
                _buildLoginButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {},
        color: Colors.red.shade900,
        child: Text(
          'Login',
          style:
              TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Ubuntu'),
        ),
      ),
    );
  }

  TextFormField _buildTextFormField(String title) {
    return TextFormField(
      onEditingComplete:(){
        print('We Finished typing this field');
      },
      onFieldSubmitted: (value){
        print(value);
      },
      onTap: (){
        print('I will type some thing in this field ya_amer');
      },
      decoration: InputDecoration(
        // focusColor: Colors.white,
        labelText: title,
        filled: true,
        fillColor: Colors.white70.withOpacity(0.5),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(20)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white70,
          width: 2,
        )),
      ),
    );
  }
}
