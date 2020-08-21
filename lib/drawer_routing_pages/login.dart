import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
          appBar: AppBar(
            elevation: 10,
            centerTitle: true,
            backgroundColor: Colors.red.shade900,
            title: Text('Login Page'),
          ),
          body: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 16, right: 8, left: 8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _buildNameTextFormField(),
                            SizedBox(height: 50),
                            _buildEmailTextFormField(),
                            SizedBox(
                              height: 50,
                            ),
                            _buildPasswordTextFormField(),
                            SizedBox(
                              height: 50,
                            ),
                            _buildLoginButton(),
                          ]),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  SizedBox _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.red.shade900,
        onPressed: () {},
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  TextFormField _buildPasswordTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
     keyboardAppearance: Brightness.dark,
      onFieldSubmitted: (value){
        var length=value.length; //this is used to know the password if user used spaces for his password
        print('$value [the number of characters are] $length');
      },
      obscureText: true,
      style: TextStyle(
          color: Colors.green, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.blue,
            width: 1,
          )),
          labelText: 'Enter your Password',
          labelStyle: TextStyle(
            color: Colors.red.shade900,
            fontSize: 12,
          )),
    );
  }

  TextFormField _buildNameTextFormField() {
    return TextFormField(
      onFieldSubmitted: (string ){
        print(string);
        //hint you have click the enter button after filling the button ua_amer,problem solved
      },
      style: TextStyle(color: Colors.green, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
          // icon: Icon(Icons.add_location),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.blue,
            width: 1,
          )),
          labelText: 'Enter your name',
          labelStyle: TextStyle(
            color: Colors.red.shade900,
            fontSize: 12,
          )),
    );
  }

  TextFormField _buildEmailTextFormField() {
    return TextFormField(
     // obscureText: true,
      style: TextStyle(
          color: Colors.blue, fontSize: 15, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple, width: 2)),
          labelText: 'Enter your email',
          labelStyle: TextStyle(
            color: Colors.red.shade900,
            fontSize: 12,
          )),
    );
  }
}
