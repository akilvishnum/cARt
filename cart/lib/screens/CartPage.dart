import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: height * 0.12,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              child: Text('Cart',
                                  style: TextStyle(
                                      fontSize: height * 0.03,
                                      fontFamily: 'Bold',
                                      color: Colors.white,
                                      letterSpacing: height * 0.03 * 0.01)),
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
                                child: Container(
                                  height: height * 0.065,
                                  width: height * 0.065,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(90, 90, 90, 100),
                                    borderRadius:
                                        BorderRadius.circular(height * 0.022),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/icons/back.svg',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: Container(
                padding:
                     EdgeInsets.only(top: width * 0.035 / 2 + 4,),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(height * 0.05),
                      topLeft: Radius.circular(height * 0.05)),
                ),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          left: width * 0.035, right: width * 0.035),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height * 0.025 / 2),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: 5000),
                            child: ListView.builder(
                                padding: EdgeInsets.all(0),
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: 3,
                                itemBuilder: (BuildContext context, int index) {
                                  return CartProductContainer();
                                }),
                          ),
                          SizedBox(height: height * 0.0125),
                          Container(
                            child: Text(
                              'ORDER SUMMARY',
                              style: TextStyle(
                                  fontFamily: 'Medium',
                                  fontSize: 18,
                                  letterSpacing: 18 * 0.05),
                            ),
                          ),
                          SizedBox(height: height * 0.0075),
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(248, 248, 248, 1),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(width * 0.05), topRight: Radius.circular(width * 0.05),),
                            ),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxHeight: 50000000000),
                              child: ListView.builder(
                                  padding: EdgeInsets.all(0),
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: 3,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return SubTotalContainer();
                                  }),
                            ),
                          ),
                          SizedBox(height: height * 0.108)
                        ],
                      ),
                    ), ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: buildBlur(
                        child: Center(
                          child: Container(
                            height: height * 0.108,
                            padding: EdgeInsets.only(
                                top: height * 0.02,
                                bottom: height * 0.02,
                                left: width * 0.075,
                                right: width * 0.075),
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(
                                            196, 196, 196, 100)))),
                            child: InkWell(
                              onTap: () {
                                // actionSheet(context);
                              },
                              child: Center(
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Positioned(
                                          child: Container(
                                            height: height * 0.065,
                                            width: width * 0.85,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          child: Container(
                                            height: height * 0.065,
                                            width: width * 0.85,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: <Color>[
                                                  Color.fromRGBO(
                                                      255, 255, 255, 0.11),
                                                  Color.fromRGBO(
                                                      255, 255, 255, 0)
                                                ],
                                                stops: [0.2, 0.6],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          child: Container(
                                            height: height * 0.065,
                                            width: width * 0.85,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text("Pay \$719",
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
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubTotalContainer extends StatelessWidget {
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.080,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width * 0.075,
                height: width * 0.075,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(191, 191, 191, 100),
                ),
                child: Center(
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontFamily: 'Bold',
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(width: width * 0.02),
              Container(
                width: width * 0.35,
                child: Text('Soft Sofa - Peachy Pink',
                    style: TextStyle(
                      fontFamily: 'Bold',
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 2),
              ),
              SizedBox(width: width * 0.05),
              Container(
                child: Text('x',
                    style: TextStyle(
                      fontFamily: 'Medium',
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 2),
              ),
              SizedBox(width: width * 0.02),
              Container(
                child: Text('1',
                    style: TextStyle(
                      fontFamily: 'Bold',
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 2),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      child: Text(
                    '\$1123',
                    style: TextStyle(
                      fontFamily: 'Bold',
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  )),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class CartProductContainer extends StatelessWidget {
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 10),
          // height: width * 0.2
          decoration: BoxDecoration(
            color: Color.fromRGBO(248, 248, 248, 1),
            borderRadius: BorderRadius.all(Radius.circular(width * 0.05)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: new Image.asset(
                  'assets/products/phone.png',
                  width: width * 0.2,
                  height: width * 0.2,
                ),
              ),
              SizedBox(width: 20),
              Container(
                height: width * 0.2,
                width: width * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Soft Sofa - Peachy Pink',
                      style: TextStyle(
                        fontFamily: 'Bold',
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                    ),
                    Text(
                      '\$1123',
                      style: TextStyle(
                        fontFamily: 'Medium',
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ProductCounter(),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}

Widget buildBlur(
        {@required Widget child, double sigmaX = 10, double sigmaY = 10}) =>
    ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
        child: child,
      ),
    );

class ProductCounter extends StatefulWidget {
  @override
  _ProductCounterState createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  var count = 1;
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                if (count > 1) {
                  count--;
                } else
                  count = 1;
              });
            },
            child: Container(
              width: width * 0.065,
              height: width * 0.065,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      count == 1 ? Colors.red.withOpacity(0.3) : Colors.black),
              child: Center(
                child: SvgPicture.asset(
                  count == 1
                      ? 'assets/icons/trash.svg'
                      : 'assets/icons/minus.svg',
                  color: count == 1 ? Colors.red : Colors.white,
                  width: width * 0.035,
                  height: width * 0.035,
                ),
              ),
            ),
          ),
          SizedBox(width: width * 0.008),
          Container(
              child: Text(count.toString(),
                  style:
                      TextStyle(fontSize: width * 0.06, fontFamily: 'Medium'))),
          SizedBox(width: width * 0.008),
          InkWell(
            onTap: () {
              setState(() {
                count++;
              });
            },
            child: Container(
              width: width * 0.065,
              height: width * 0.065,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/plus.svg',
                  color: Colors.white,
                  width: width * 0.035,
                  height: width * 0.035,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
