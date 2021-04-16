import 'package:cart/screens/productPage.dart';
import 'package:cart/screens/SignupPage.dart';
import 'package:cart/screens/ARDisplay.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cart/screens/CartPage.dart';
import 'package:cart/screens/SplashScreen.dart';
import 'package:cart/screens/LoginPage.dart';

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
        backgroundColor: Color.fromRGBO(248, 248, 248, 1),
        body: Container(
            height: height,
            child: SingleChildScrollView(
                child: Container(
              height: height,
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
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
                      style:
                          TextStyle(fontSize: 20, fontFamily: 'HomeMadeApple'),
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Color.fromRGBO(191, 191, 191, 100),
                        elevation: 0,
                        child: Text("Signup",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'Bold')),
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('Products')
                              .doc("nwso001")
                              .set({
                            'productId': 'nwso001',
                            'productName': 'Peachy Pink Sofa',
                            'productType': 'Non-Wearable',
                            'category': 'Sofa',
                            'price': 12000,
                            'colorName': ["Peachy Pink"],
                            'colorHex': ["0xffffb6c1"],
                            'description':
                                'Premium look & feel at a pocket-friendly price. Compact and lightweight, with anti-skid features for unhindered comfort. Perfect for outdoor activities as well as to make a statement',
                            'variants': ['Powerless'],
                            'specifications': {
                              'Dimension':
                                  'Medium Size, Frame Length : 58Mm, Wide : 14Mm, Height: 140Mm,',
                              'Lens': 'PolyCarbonate Lens'
                            }
                          }).then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          });
                        },
                      )),
                      SizedBox(width: width * 0.03),

                      // Changed to new button UI
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SplashScreen()));
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Positioned(
                                  child: Container(
                                    height: 50,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  child: Container(
                                    height: 50,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: <Color>[
                                          Color.fromRGBO(255, 255, 255, 0.11),
                                          Color.fromRGBO(255, 255, 255, 0)
                                        ],
                                        stops: [0.2, 0.6],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  child: Container(
                                    height: 50,
                                    width: 150,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("Login",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                fontFamily: 'Bold',
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ))));
  }
}
