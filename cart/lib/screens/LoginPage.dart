import 'package:cart/screens/HomePage.dart';
import 'package:cart/screens/SignupPage.dart';
import 'package:cart/screens/SplashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double width, height;
  String email, password;
  String info = '';
  final _loginkey = new GlobalKey<FormState>();
  bool _obscureText = true;
  void showToast(bool error, String info) {
    Fluttertoast.showToast(
      msg: (!error)
          ? "Logged in Successfully"
          : (info ==
                  "There is no user record corresponding to this identifier. The user may have been deleted.")
              ? "User Not Found"
              : (info ==
                      "The password is invalid or the user does not have a password.")
                  ? "Invalid Password"
                  : "Something Went Wrong!",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
    );
  }

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
            child: Form(
              key: _loginkey,
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
                                style: TextStyle(
                                    fontSize: 28, fontFamily: 'Bold'))),
                        Container(
                            child: Text("AR Shopping Experience.",
                                style: TextStyle(
                                    fontSize: 28, fontFamily: 'Bold'))),
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
                          color: Color.fromRGBO(191, 191, 191, 100),
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
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10)),
                            validator: (mail) {
                              if (mail.isEmpty) {
                                return "Email  can't be empty";
                              } else if (mail.contains(new RegExp(r'[a-z]'))) {
                                Pattern pattern =
                                    r'^([a-z0-9_\-\.]+)@([a-z.]+)\.([a-z]{2,5})$';
                                RegExp regex = new RegExp(pattern);
                                if (!regex.hasMatch(mail))
                                  return 'Invalid email';
                                else
                                  return null;
                              }
                              return null;
                            },
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
                          color: Color.fromRGBO(191, 191, 191, 100),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        width: width * 0.94,
                        height: 60,
                        child: Container(
                          child: TextFormField(
                            obscureText: _obscureText,
                            onChanged: (val) {
                              password = val;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon((_obscureText)
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                            ),
                            validator: (pass) {
                              if (pass.isEmpty)
                                return "Password can't be empty";
                              else if (pass.length < 6)
                                return "Password should be atleast 6 characters";
                              return null;
                            },
                          ),
                        )),
                  ),
                  SizedBox(height: height * 0.06),
                  InkWell(
                    onTap: () async {
                      if (_loginkey.currentState.validate()) {
                        String newUser;
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email, password: password);
                          newUser = FirebaseAuth.instance.currentUser.uid;
                          print(newUser);
                        } catch (e) {
                          print(e.message);
                          newUser = null;
                          info = e.message.toString();
                        }
                        if (newUser != null) {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          preferences.setString("user", newUser);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SplashScreen()));
                          showToast(false, info);
                        } else {
                          _loginkey.currentState.reset();
                          showToast(true, info);
                        }
                      }
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
                                ),
                              ),
                              Positioned(
                                child: Container(
                                  height: 60,
                                  width: width * 0.94,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("New User?",
                            style:
                                TextStyle(fontSize: 18, fontFamily: 'Medium')),
                        SizedBox(width: width * 0.01),
                        FlatButton(
                          color: Colors.transparent,
                          child: Text(
                            "Sign up",
                            style:
                                TextStyle(fontSize: 18, fontFamily: 'Medium'),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()));
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
