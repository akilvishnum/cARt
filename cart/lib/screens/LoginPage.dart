import 'package:cart/screens/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double width, height;
  String email;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Image(
                    width: 100,
                    height: 100,
                    image: AssetImage("assets/icons/Logo.png"))),
            SizedBox(height: height * 0.01),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Text("Join with us to enjoy",
                          style: TextStyle(fontSize: 24, fontFamily: 'Bold'))),
                  Container(
                      child: Text("AR Shopping Experience.",
                          style: TextStyle(fontSize: 24, fontFamily: 'Bold'))),
                ],
              ),
            ),
            SizedBox(height: height * 0.08),
            Container(
              child: Text("EMAIL ADDRESS",
                  style: TextStyle(fontSize: 18, fontFamily: 'Medium')),
            ),
            SizedBox(height: height * 0.01),
            Center(
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                  ),
                  width: width * 0.94,
                  child: Container(
                    child: TextFormField(
                      onChanged: (val) {
                        email = val;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email address',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      validator: (agentName) {},
                    ),
                  )),
            ),
            SizedBox(height: height * 0.03),
            Container(
              child: Text("PASSWORD",
                  style: TextStyle(fontSize: 18, fontFamily: 'Medium')),
            ),
            SizedBox(height: height * 0.01),
            Center(
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                  ),
                  width: width * 0.94,
                  child: Container(
                    child: TextFormField(
                      onChanged: (val) {
                        email = val;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      validator: (agentName) {},
                    ),
                  )),
            ),
            SizedBox(height: height * 0.07),
            ButtonTheme(
                child: MaterialButton(
              minWidth: width * 0.94,
              height: 50,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Color.fromRGBO(0, 0, 0, 1),
              child: Text("Login",
                  style: TextStyle(
                      fontFamily: 'Bold',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromRGBO(255, 255, 255, 1))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            )),
            SizedBox(height: height * 0.01),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New User?",
                      style: TextStyle(fontSize: 18, fontFamily: 'Medium')),
                  SizedBox(width: width * 0.01),
                  FlatButton(
                    color: Colors.transparent,
                    child: Text(
                      "Sign up",
                      style: TextStyle(fontSize: 18, fontFamily: 'Medium'),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomePage()));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
