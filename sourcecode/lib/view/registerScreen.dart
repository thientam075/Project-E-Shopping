import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
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

                    },
                  ),
                  FlatButton(
                    onPressed: ()
                    {

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
}
