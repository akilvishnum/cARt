import 'package:cart/screens/LoginPage.dart';
import 'package:cart/screens/welcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  double width, height;
  String email, password, repassword;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
      body: SingleChildScrollView(
        child: Container(
          height: height,
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
                            style:
                                TextStyle(fontSize: 28, fontFamily: 'Bold'))),
                    Container(
                        child: Text("AR Shopping Experience.",
                            style:
                                TextStyle(fontSize: 28, fontFamily: 'Bold'))),
                  ],
                ),
              ),
              SizedBox(height: height * 0.06),
              Container(
                child: Text("EMAIL ADDRESS",
                    style: TextStyle(fontSize: 18, fontFamily: 'Medium')),
              ),
              SizedBox(height: height * 0.01),
              Center(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    width: width * 0.94,
                    height: 60,
                    child: Container(
                      child: TextFormField(
                        onChanged: (val) {
                          email = val;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        //validator: (agentName) {},
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
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    width: width * 0.94,
                    height: 60,
                    child: Container(
                      child: TextFormField(
                        onChanged: (val) {
                          password = val;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        //validator: (agentName) {},
                      ),
                    )),
              ),
              SizedBox(height: height * 0.03),
              Container(
                child: Text("CONFIRM PASSWORD",
                    style: TextStyle(fontSize: 18, fontFamily: 'Medium')),
              ),
              SizedBox(height: height * 0.01),
              Center(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    width: width * 0.94,
                    height: 60,
                    child: Container(
                      child: TextFormField(
                        onChanged: (val) {
                          repassword = val;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        //validator: (agentName) {},
                      ),
                    )),
              ),
              SizedBox(height: height * 0.06),
              InkWell(
                onTap: () async {
                  // if (password == repassword) {
                  // UserCredential user = await FirebaseAuth.instance
                  //     .createUserWithEmailAndPassword(
                  //         email: email, password: password);
                  // print(FirebaseAuth.instance.currentUser.uid);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                  // } else {}
                },
                child: Center(
                  // Changed to new button UI
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            child: Container(
                              height: 60,
                              width: width * 0.94,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              height: 60,
                              width: width * 0.94,
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
<<<<<<< Updated upstream
                            ),
=======
                            ),
<<<<<<< HEAD
                          ),
                          Positioned(
                            child: Container(
                              height: 60,
                              width: width * 0.94,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Signup",
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
              ),
=======
                        ),
                      ),
                    ),
                      Positioned( 
                        child: Container(
                          height: 60, width: width * 0.94,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                                children:[ Text("Signup",
                                style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: 'Bold',
                              color: Colors.white)),
                              ],
>>>>>>> Stashed changes
                          ),
                          Positioned(
                            child: Container(
                              height: 60,
                              width: width * 0.94,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Signup",
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
              ),
<<<<<<< Updated upstream
=======
            ),
>>>>>>> 0d5e4ae352e2a0a2dddadf5a5af940d3b15ac6d9
>>>>>>> Stashed changes
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                        style: TextStyle(fontSize: 18, fontFamily: 'Medium')),
                    SizedBox(width: width * 0.01),
                    FlatButton(
                      color: Colors.transparent,
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 18, fontFamily: 'Medium'),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
