import 'package:cart/screens/SignupPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
                              .doc("nwlp001")
                              .set({
                            'productId': 'nwlp001',
                            'productName':
                                'MSI GF63 Thin 9SCXR-418IN Gaming Laptop',
                            'productType': 'Non-Wearable',
                            'category': 'Laptop',
                            'price': 54990,
                            'colorName': ["Black"],
                            'colorHex': ["0xff000000"],
                            'description':
                                'This MSI laptop can be your new device on which you can play fast-paced and contemporary games smoothly. Its powerful processor ensures that you get only smooth performance while using it. What’s more, it functions quietly, so using it will be a delightful experience for anyone who wants to work/game without causing any disturbance to others in the room.',
                            'variants': ['4GB/512GB SSD', '8GB/512GB SSD'],
                            'specifications': {
                              'Processor':
                                  'The performance is powerful and seamless, as it comes with an efficient 9th Intel Core i5 processor.',
                              'Graphics':
                                  'Dedicated graphic memory Type: GDDR6, Graphic memory capacity:  4GB',
                              'Graphic Processor':
                                  'NVIDIA GeForce GTX 1650 Max-Q',
                              'Operating System':
                                  'Windows 10 Home, OS Architecture: 64 bit'
                            }
                          }).then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()));
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
