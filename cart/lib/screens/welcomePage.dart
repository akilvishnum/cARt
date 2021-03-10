import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color.fromRGBO(229, 229, 229, 1),
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Image(
              image: AssetImage("assets/images/HeaderImage.png"),
            )),
            SizedBox(height: height * 0.02),
            Container(
              child: Text(
                "Cart",
                style: TextStyle(fontSize: 20, fontFamily: 'HomeMadeApple'),
              ),
            ),
            SizedBox(height: height * 0.001),
            Container(
                child: Text("New AR Shopping Experience!",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Bold'))),
            SizedBox(height: height * 0.1),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonTheme(
                    child: MaterialButton(
                  minWidth: 150,
                  height: 50,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Color.fromRGBO(197, 197, 197, 1),
                  child: Text("Signup",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: 'Bold')),
                  onPressed: () {},
                )),
                SizedBox(width: width * 0.03),
                ButtonTheme(
                    child: MaterialButton(
                  minWidth: 150,
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
                  onPressed: () {},
                ))
              ],
            )),
          ],
        )));
  }
}
