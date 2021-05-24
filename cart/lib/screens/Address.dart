import 'package:cart/screens/Payment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Address extends StatefulWidget {
  int amount;
  List<String> productid;
  List<int> quantity;
  Address({this.amount, this.productid, this.quantity});
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  String user, name, phonenumber, pincode, addr, state, country;
  bool recentAddr = false;
  Map<String, dynamic> address;
  final _addressKey = new GlobalKey<FormState>();
  void getDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    user = preferences.getString("user");
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(user)
        .get()
        .then((value) {
      setState(() {
        address = value.data()['userContact'];
        print(address);
        if (value.data()['userContact']['name'] != null &&
            value.data()['userContact']['name'] != "")
          setState(() {
            recentAddr = true;
          });
      });
    });
  }

  @override
  void initState() {
    getDetails();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container(
                  // Heading
                  height: height * 0.12,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Center(
                              child: Container(
                                child: Text('Address',
                                    style: TextStyle(
                                        fontSize: height * 0.027,
                                        fontFamily: 'Bold',
                                        color: Colors.black,
                                        letterSpacing: height * 0.027 * 0.01)),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              bottom: 0,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/back.svg',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              recentAddr
                  ? Container(
                      // Already FILLed address
                      width: width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 3, right: 3, top: 5),
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text("RECENTLY USED",
                                      style: TextStyle(
                                          fontSize: 18, fontFamily: 'Medium')),
                                ),
                                SizedBox(height: height * 0.005),
                                Container(
                                  child: Text(address['name'],
                                      style: TextStyle(
                                          fontSize: 20, fontFamily: 'Bold')),
                                ),
                                SizedBox(height: height * 0.005),
                                Container(
                                  child: Text(address['phoneNumber'],
                                      style: TextStyle(
                                          fontSize: 20, fontFamily: 'Bold')),
                                ),
                                SizedBox(height: height * 0.005),
                                Container(
                                  child: Text(
                                      "${address['address']},\n${address['state']},\n${address['country']}-${address['pincode']}",
                                      style: TextStyle(
                                          fontSize: 20, fontFamily: 'Bold')),
                                ),
                                SizedBox(height: height * 0.03),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartPayment(
                                          amount: widget.amount,
                                          productid: widget.productid,
                                          quantity: widget.quantity)));
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        child: Container(
                                          height: 60,
                                          width: width * 0.94,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: <Color>[
                                                Color.fromRGBO(
                                                    255, 255, 255, 0.11),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text("Continue with this address",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                          SizedBox(height: height * 0.04),
                          Center(
                            child: Text("Add new address",
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Bold')),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              Container(
                child: Form(
                  key: _addressKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.005),
                      Container(
                        child: Text("NAME",
                            style:
                                TextStyle(fontSize: 18, fontFamily: 'Medium')),
                      ),
                      SizedBox(height: height * 0.01),
                      Center(
                        child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(191, 191, 191, 100),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            width: width * 0.94,
                            height: 60,
                            child: Container(
                              child: TextFormField(
                                onChanged: (val) {
                                  name = val;
                                },
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 10)),
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return "Name can't be empty";
                                  }
                                  return null;
                                },
                              ),
                            )),
                      ),
                      SizedBox(height: height * 0.03),
                      Container(
                        child: Text("PHONE NUMBER",
                            style:
                                TextStyle(fontSize: 18, fontFamily: 'Medium')),
                      ),
                      SizedBox(height: height * 0.01),
                      Center(
                        child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(191, 191, 191, 100),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            width: width * 0.94,
                            height: 60,
                            child: Container(
                              child: TextFormField(
                                onChanged: (val) {
                                  phonenumber = val;
                                },
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 10)),
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return "Phone Numbercan't be empty";
                                  }
                                  return null;
                                },
                              ),
                            )),
                      ),
                      SizedBox(height: height * 0.03),
                      Container(
                        child: Text("PIN CODE",
                            style:
                                TextStyle(fontSize: 18, fontFamily: 'Medium')),
                      ),
                      SizedBox(height: height * 0.01),
                      Center(
                        child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(191, 191, 191, 100),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            width: width * 0.94,
                            height: 60,
                            child: Container(
                              child: TextFormField(
                                onChanged: (val) {
                                  pincode = val;
                                },
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 10)),
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return "Pincode can't be empty";
                                  }
                                  return null;
                                },
                              ),
                            )),
                      ),
                      SizedBox(height: height * 0.03),
                      Container(
                        child: Text("ADDRESS",
                            style:
                                TextStyle(fontSize: 18, fontFamily: 'Medium')),
                      ),
                      SizedBox(height: height * 0.01),
                      Center(
                        child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(191, 191, 191, 100),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            width: width * 0.94,
                            height: 60,
                            child: Container(
                              child: TextFormField(
                                onChanged: (val) {
                                  addr = val;
                                },
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 10)),
                                validator: (mail) {
                                  if (mail.isEmpty) {
                                    return "Address can't be empty";
                                  }
                                  return null;
                                },
                              ),
                            )),
                      ),
                      SizedBox(height: height * 0.03),
                      Container(
                        child: Text("STATE",
                            style:
                                TextStyle(fontSize: 18, fontFamily: 'Medium')),
                      ),
                      SizedBox(height: height * 0.01),
                      Center(
                        child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(191, 191, 191, 100),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            width: width * 0.94,
                            height: 60,
                            child: Container(
                              child: TextFormField(
                                onChanged: (val) {
                                  state = val;
                                },
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 10)),
                                validator: (mail) {
                                  if (mail.isEmpty) {
                                    return "State can't be empty";
                                  }
                                  return null;
                                },
                              ),
                            )),
                      ),
                      SizedBox(height: height * 0.03),
                      Container(
                        child: Text("COUNTRY",
                            style:
                                TextStyle(fontSize: 18, fontFamily: 'Medium')),
                      ),
                      SizedBox(height: height * 0.01),
                      Center(
                        child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(191, 191, 191, 100),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            width: width * 0.94,
                            height: 60,
                            child: Container(
                              child: TextFormField(
                                onChanged: (val) {
                                  country = val;
                                },
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 10)),
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return "Country can't be empty";
                                  }
                                  return null;
                                },
                              ),
                            )),
                      ),
                      SizedBox(height: height * 0.03),
                      InkWell(
                        onTap: () async {
                          if (_addressKey.currentState.validate()) {
                            await FirebaseFirestore.instance
                                .collection("Users")
                                .doc(user)
                                .update({
                              'userContact': {
                                'name': name,
                                'phoneNumber': phonenumber,
                                'address': addr,
                                "state": state,
                                'country': country,
                                'pincode': pincode
                              }
                            }).then((_) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CartPayment(amount: widget.amount)));
                              // setState(() {
                              //   Naviga
                              //   _addressKey.currentState.reset();
                              // });
                            });
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text("Confirm Address",
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
