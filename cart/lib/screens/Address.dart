import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context){
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool recentAddr = false;
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container( // Heading
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
                  )
                ),
                recentAddr ?
                Container(
                  // Already FILLed address
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Container(
                        padding: EdgeInsets.only(left: 3, right: 3, top: 5),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Container(
                              child: Text("RECENTLY USED",
                                  style: TextStyle(fontSize: 18, fontFamily: 'Medium')),
                            ),
                            SizedBox(height: height * 0.005),
                            Container(
                              child: Text("Akil",
                                  style: TextStyle(fontSize: 20, fontFamily: 'Bold')),
                            ),
                            SizedBox(height: height * 0.005),
                            Container(
                              child: Text("9047618511",
                                  style: TextStyle(fontSize: 20, fontFamily: 'Bold')),
                            ), SizedBox(height: height * 0.005),
                            Container(
                              child: Text("18 - CART Head Office \n Tamil Nadu - 1234 \n India",
                                  style: TextStyle(fontSize: 20, fontFamily: 'Bold')),
                            ),
                            SizedBox(height: height * 0.03),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {

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
                                          Text("Continue with this address",
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
                      SizedBox(height: height * 0.04),
                      Center(
                        child:Text("Add new address",
                            style: TextStyle(fontSize: 20, fontFamily: 'Bold')),
                      ),
                    ],
                  ),
                )
                : Container(

                ),
                Container(
                child: Form(
                  // key: _loginkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.005),
                      Container(
                        child: Text("NAME",
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
                                  // email = val;
                                },
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 10)),
                              ),
                            )),
                      ),
                      SizedBox(height: height * 0.03),
                      Container(
                        child: Text("PHONE NUMBER",
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
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  border: InputBorder.none,
                                ),
                              ),
                            )),
                      ),
                      SizedBox(height: height * 0.03),
                      Container(
                        child: Text("PIN CODE",
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
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  border: InputBorder.none,
                                ),
                              ),
                            )),
                      ),
                      SizedBox(height: height * 0.03),
                      Container(
                        child: Text("ADDRESS",
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
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  border: InputBorder.none,
                                ),
                              ),
                            )),
                      ),
                      SizedBox(height: height * 0.03),
                      Container(
                        child: Text("STATE",
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
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  border: InputBorder.none,
                                ),
                              ),
                            )),
                      ),
                      SizedBox(height: height * 0.03),
                      Container(
                        child: Text("COUNTRY",
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
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  border: InputBorder.none,
                                ),
                              ),
                            )),
                      ),
                      SizedBox(height: height * 0.03),
                      InkWell(
                        onTap: () {

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
