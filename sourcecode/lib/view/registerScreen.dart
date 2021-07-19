import 'package:e_shopping_application/AllScreens/loginScreen.dart';
import 'package:e_shopping_application/AllWidget/progressDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../main.dart';
import 'mainScreen.dart';

class RegisterScreen extends StatelessWidget {
  @override

  static const String idScreen  = "register";

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
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
              height: 220.0,
              alignment: Alignment.center,
            ),
            SizedBox(height: 1.0,),
            Text(
              "Register Account",
              style: TextStyle(fontSize: 24.0, fontFamily: "Brand-Bold", color: Colors.orange),
              textAlign: TextAlign.center,

            ),
            SizedBox(height: 1.0,),



            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [

                  SizedBox(height: 0.0,),
                  TextField(
                    controller: nameTextEditingController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      //border: OutlineInputBorder(),
                      labelText: "Name",
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
                  SizedBox(height: 1.0,),
                  TextField(
                    controller: phoneTextEditingController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      //border: OutlineInputBorder(),
                      labelText: "Phone",
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

                  SizedBox(height: 1.0,),
                  TextField(
                    controller: emailTextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      //border: OutlineInputBorder(),
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
                      //border: OutlineInputBorder(),
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
                      if(nameTextEditingController.text.length < 3 )
                      {
                        displayToastMessage(
                            "Name must be least 3 character.", context);
                      }
                      else if(!emailTextEditingController.text.contains("@"))
                      {
                        displayToastMessage("Email  address is not Valid.", context);
                      }
                      else if(phoneTextEditingController.text.isEmpty)
                      {
                        displayToastMessage("Phone Number is madatory.", context);
                      }
                      else if(passwordTextEditingController.text.length <6)
                      {
                        displayToastMessage("Password must be least 6 character.", context);
                      }
                      else {
                        registerNewUser(context);
                      }
                    },
                  ),
                  FlatButton(
                    onPressed: ()
                    {
                      Navigator.pushNamedAndRemoveUntil(context, LoginScreen.idScreen, (route) => false);
                    },
                    child: Text(
                        "Already have an Account? Login Here."
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

  void registerNewUser(BuildContext context) async
  {
    showDialog(
        context: context, barrierDismissible: false,
        builder: (BuildContext context)
        {
          return ProgressDialog(message: "Registering, Please wait...",);
        }
    );
    final User? firebaseUser  = (await _firebaseAuth
        .createUserWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text
    ).catchError((errMsg){
      Navigator.pop(context);
      displayToastMessage("Error: "+ errMsg.toString(), context);
    })).user;

    if(firebaseUser != null)//user create
        {
      //usersRef.child(firebaseUser.uid);

      Map userDataMap = {
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": phoneTextEditingController.text.trim(),
      };
      //save user info to DB
      usersRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage("Congratulations, your account has been created.", context);
      Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
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