import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_store/pages/home_page.dart';
import 'package:unicode/unicode.dart'as unicode;
class AdvancedLoginTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AdvancedLoginTwoState();
  }
}

class _AdvancedLoginTwoState extends State<AdvancedLoginTwo> {
  GlobalKey<FormState> loginFormState = GlobalKey();
  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
//Icon arrowIcon=Icon(Icons.arrow_forward) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildBackgroundContainer(),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildLoginHeader(),
                _buildNamePasswordFields(nameController,passwordController),
                _buildOkButton(),
                SizedBox(height: 40,),
                _buildSignUpRow(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row _buildSignUpRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Text('Your first time?',style:TextStyle(color: Colors.white70,fontSize: 20),),
        SizedBox(width: 20,),
        GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed('login');
            },
            child: Text('Sign Up',style: TextStyle(color: Colors.white,fontSize: 20),)),
      ],
    );
  }

  Align _buildOkButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          width: 120,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FlatButton(
                onPressed: (){
                  setState(
                          (){

                        if(loginFormState.currentState.validate()){
                          Navigator.of(context).pushNamed('home_page');
                        }else{
                          return null;
                        }
                      }
                  );
                },
                child: Text(
                  'OK',
                  style:
                  TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.black,
                size: 30,
              ),
            ],
          )),
    );
  }

  Form _buildNamePasswordFields(TextEditingController nameController,TextEditingController passwordController) {
    return Form(
      key: loginFormState,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value){
                if(value.isEmpty){
                  return 'This Field must be validate';
                }
                return null;
              },
              controller: nameController,
              showCursor: true,
              cursorWidth: 5,
              cursorColor: Colors.white,
              cursorRadius: Radius.circular(10),
              decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.red.shade700,fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'OpenSans'),
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.transparent,
//                fillColor: Color(0xff5C1AF3),
//                fillColor:Color(0xff597AF9),
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            TextFormField(
              validator: (value){
                if(value.isEmpty){
                  return 'this Field must be validate';
                }return null;
              },
              controller: passwordController,
              obscureText: true,
              showCursor: true,
              cursorRadius:Radius.circular(10) ,
              cursorWidth: 5,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.red.shade700,fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'OpenSans'),
                hintStyle: TextStyle(color: Colors.white54, fontSize: 24),
                filled: true,
                fillColor: Colors.transparent,
                // fillColor: Color(0xff5C1AF3),
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildLoginHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Sign in',
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'A world of possibility in an app',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            wordSpacing: 9,
          ),
          textAlign: TextAlign.start,
          maxLines: 3,
        ),
      ],
    );
  }

  RaisedButton _buildRaisedButton(
      GlobalKey<FormState> loginFormState, BuildContext context) {
    return RaisedButton(
      child: Text('Login'),
      onPressed: () {
        setState(() {
          if (loginFormState.currentState.validate()) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HomePage();
            }));
          }
        });
      },
    );
  }

  Container _buildBackgroundContainer() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff597AF9),
            Color(0xff5C4AF5),
            Color(0xff5C1AF3),
          ],
          stops: [
            0.2,
            0.7,
            0.9,
          ],
        ),
      ),
    );
  }
}
