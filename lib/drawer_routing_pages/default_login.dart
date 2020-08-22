import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:phone_store/pages/home_page.dart';

class DefaultLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DefaultLoginState();
  }
}

class _DefaultLoginState extends State<DefaultLogin> {
  bool rememberMe = true;
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> loginFormKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: loginFormKey,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff73AEF5),
                          Color(0xff61A4F1),
                          Color(0xff478DE0),
                          Color(0xff398AE5),
                        ],
                        stops: [
                          0.1,
                          0.4,
                          0.7,
                          0.9
                        ]),
                  ),
                ),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding:
                        EdgeInsets.symmetric(vertical: 120, horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'sign In',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _buildTextFieldName('Email'),
                            SizedBox(
                              height: 8.0,
                            ),
                            _buildEmailTextField(userName),
                            SizedBox(
                              height: 8.0,
                            ),
                            _buildTextFieldName('Password'),
                            SizedBox(
                              height: 8.0,
                            ),
                            buildPasswordTextField(password),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.centerRight,
                              child: Text(
                                'ForgotPassword',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  activeColor: Colors.white,
                                  checkColor: Colors.green,
                                  value: rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      rememberMe = value;
                                    });
                                  },
                                ),
                                Container(
                                  child: Text(
                                    'Remember me',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            _buildLoginButton(),
                            _buildSignInButton(),
                            _buildFacebookGoogleLogos(),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {
                                  print('sign Up btn pressed');
                                },
                                child: RichText(
                                  text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text: "Don't have an account?",
                                    ),
                                    TextSpan(
                                        text: ' Sign Up',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffFEFEFD))),
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFacebookGoogleLogos() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print('We need to sign up using faceBook account');
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0, 10),
                    blurRadius: 5,
                  ),
                ],
                image: DecorationImage(
                    image: ExactAssetImage('images/facebook.png'),
                    fit: BoxFit.cover),
                //color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('We need to sign up using Google account');
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(1, 10),
                      blurRadius: 5)
                ],
                image: DecorationImage(
                    image: ExactAssetImage('images/google.png'),
                    fit: BoxFit.cover),
                //color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _buildSignInButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Text(
            '-OR-',
            style: TextStyle(color: Colors.white),
          ),
        ),
        RaisedButton(
          elevation: 0,
          color: Color(0xff398AE5),
          onPressed: () {},
          child: Text(
            'sign in with',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  SizedBox _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        child: RaisedButton(
          color: Color(0xffFEFEFD),
          padding: EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(120)),
          elevation: 8,
          child: Text('LOGIN'),
          onPressed: () {
        setState(() {
          if(loginFormKey.currentState.validate()){
            Navigator.push(context,MaterialPageRoute(
              builder: (context){
                return HomePage();
              }
            ));
          }
        }
        );
          },
        ),
      ),
    );
  }

  Widget buildPasswordTextField(
      TextEditingController passwordTextEditingController) {
    return TextFormField(
      controller: passwordTextEditingController,
      validator: (value){
        if(value.isEmpty){
          return 'This field should your Password';
        }
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey),
        hintText: 'Enter your password',
        filled: true,
        fillColor: Color(0xff398AE5),
        border: InputBorder.none,
        prefixIcon: Icon(
          Icons.lock_outline,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildEmailTextField(
      TextEditingController emailTextEditingController) {
    return Container(
      //  color: Colors.blue,
      alignment: Alignment.centerLeft,
      height: 60,
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'please enter some text';
          }
          return null;
        },
        controller: emailTextEditingController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
          prefixIcon: Icon(
            Icons.email,
            color: Colors.white,
          ),
          hintText: ('Enter you Email'),
          //labelText: ('Enter your Email'),
          filled: true,
          fillColor: Color(0xff478DE0),
        ),
      ),
//                        decoration: BoxDecoration(),
    );
  }

  Container _buildTextFieldName(String name) {
    return Container(
        child: Text(
      name,
      style: TextStyle(
          fontFamily: 'OpenSans',
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold),
    ));
  }
}
