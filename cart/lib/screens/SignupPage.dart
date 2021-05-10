import 'package:cart/screens/LoginPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  double width, height;
  String email, password, repassword;
  bool _obscureText = true, _obscureText1 = true;
  final _signupkey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Form(
            key: _signupkey,
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
                                vertical: 20, horizontal: 10),
                          ),
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
                SizedBox(height: height * 0.03),
                Container(
                  child: Text("CONFIRM PASSWORD",
                      style: TextStyle(fontSize: 18, fontFamily: 'Medium')),
                ),
                SizedBox(height: height * 0.01),
                Center(
                  child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(191, 191, 191, 100),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      width: width * 0.94,
                      height: 60,
                      child: Container(
                        child: TextFormField(
                          obscureText: _obscureText1,
                          onChanged: (val) {
                            repassword = val;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon((_obscureText1)
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _obscureText1 = !_obscureText1;
                                });
                              },
                            ),
                          ),
                          validator: (repass) {
                            if (repass.isEmpty)
                              return "Password can't be empty";
                            else if (repass.length < 6)
                              return "Password should be atleast 6 characters";
                            else if (password != repass)
                              return "Password does not match";
                            return null;
                          },
                        ),
                      )),
                ),
                SizedBox(height: height * 0.06),
                InkWell(
                  onTap: () async {
                    if (_signupkey.currentState.validate()) {
                      String newUser;
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: email, password: password);
                        newUser = FirebaseAuth.instance.currentUser.uid;
                        print(FirebaseAuth.instance.currentUser.uid);
                      } catch (e) {
                        print(e.message);
                        newUser = null;
                      }
                      if (newUser != null) {
                        FirebaseFirestore.instance
                            .collection('Users')
                            .doc(newUser)
                            .set({
                          'userId': newUser,
                          'userEmail': email,
                          'userContact': {
                            'address': "",
                            'name': "",
                            'state': "",
                            'country': "",
                            'phoneNumber': "",
                            'pincode': ""
                          },
                          'cartDetails': []
                        }).then((_) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        });
                      } else {
                        _signupkey.currentState.reset();
                      }
                      Fluttertoast.showToast(
                        msg: (newUser != null)
                            ? "Account Created Successfully"
                            : "Something Went Wrong",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                      );
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
      ),
    );
  }
}
