import 'package:e_shopping_application/AllScreens/registerScreen.dart';
import 'package:e_shopping_application/AllWidget/progressDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../main.dart';
import 'mainScreen.dart';

class LoginScreen extends StatelessWidget {
  @override

  static const String idScreen  = "login";
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 45.0,),
            Image(
              image: AssetImage("images/logoes.png"),
              width: 390.0,
              height: 250.0,
              alignment: Alignment.center,
            ),
            SizedBox(height: 1.0,),
            Text(
              "Welcome Back",
              style: TextStyle(fontSize: 24.0, fontFamily: "Brand-Bold", color: Colors.orange),
              textAlign: TextAlign.center,

            ),
            SizedBox(height: 8.0,),
            Text(
              "Sign in with your email and password or continue with social media",
              style: TextStyle(fontSize: 14.0, fontFamily: "Brand-Bold", color: Colors.grey),
              textAlign: TextAlign.center,

            ),


            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [

                  SizedBox(height: 1.0,),
                  TextField(
                    controller: emailTextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      labelStyle: TextStyle(
                        fontSize: 14.0, color: Colors.indigo,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                    style: TextStyle(fontSize: 14.0),
                  ),

                  SizedBox(height: 12.0,),
                  TextField(
                    controller: passwordTextEditingController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontSize: 14.0, color: Colors.indigo,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(height: 20.0,),
                  RaisedButton(
                    color: Colors.orange,
                    textColor: Colors.white,
                    child: Container(
                      height: 50.0,
                      width: 240,
                      child: Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(fontSize: 18.0, fontFamily: "Brand-Bold"),
                        ),
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(240.0),
                        //side: BorderSide(color: Colors.red)
                    ),
                    onPressed: ()
                    {
                      if(!emailTextEditingController.text.contains("@"))
                      {
                        displayToastMessage("Email  address is not Valid.", context);
                      }
                      else if(passwordTextEditingController.text.length <6)
                      {
                        displayToastMessage("Password is madatory.", context);
                      }
                      else{
                        loginAndAutheticateUser(context);
                      }
                    },
                  ),
                  FlatButton(
                    onPressed: ()
                    {
                      Navigator.pushNamedAndRemoveUntil(context, RegisterScreen.idScreen, (route) => false);
                    },
                    child: Text(
                        "Do not have an Account? Register Here."
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void loginAndAutheticateUser(BuildContext context) async
  {
    showDialog(
        context: context, barrierDismissible: false,
        builder: (BuildContext context)
        {
          return ProgressDialog(message: "Authenticating, Please wait...",);
        }
    );
    final User? firebaseUser  = (await _firebaseAuth
        .signInWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text
    ).catchError((errMsg){
      Navigator.pop(context);
      displayToastMessage("Error: "+ errMsg.toString(), context);
    })).user;
    if(firebaseUser != null)//user create
        {
      usersRef.child(firebaseUser.uid).once().then((DataSnapshot snap){
        if(snap.value != null)
        {
          Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
          displayToastMessage("You are logged-in now.", context);
        }
        else
        {
          Navigator.pop(context);
          _firebaseAuth.signOut();
          displayToastMessage("Error Ocured.", context);
        }
      });

    }
    else
    {
      Navigator.pop(context);
      displayToastMessage("New user account hasnot been Create", context);
    }
  }

  displayToastMessage(String message, BuildContext context)
  {
    Fluttertoast.showToast(msg: message);
  }
}
