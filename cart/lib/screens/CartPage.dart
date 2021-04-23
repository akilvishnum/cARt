import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cart/Component/Products.dart';
import 'package:cart/Component/cartProducts.dart';
import 'package:cart/screens/PaymentDonePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int count = 0;
  @override
  void initState() {
    super.initState();
    if (count == 0) fetchCartProducts();
  }

  String data, user;
  List<Products> cartlist = [];
  List<CartProducts> cartDetails = [];
  List<int> productCount = [];
  void fetchCartProducts() async {
    List<Products> cartdata = [];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    user = preferences.getString("user");
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user)
          .get()
          .then((value) {
        for (int i = 0; i < value.data()['cartDetails'].length; i++) {
          if (value.data()['cartDetails'][i]['paid'] == true) continue;
          FirebaseFirestore.instance
              .collection("Products")
              .doc(value.data()['cartDetails'][i]['productId'])
              .get()
              .then((element) {
            cartDetails
                .add(CartProducts(cartDetails: value.data()['cartDetails'][i]));
            productCount.add(value.data()['cartDetails'][i]['quantity']);
            cartdata.add(Products(
                productId: element.data()['productId'],
                productName: element.data()['productName'],
                productType: element.data()['productType'],
                category: element.data()['category'],
                price: element.data()['price'],
                description: element.data()['description'],
                variants: (element.data()['variants'] != null)
                    ? List<String>.from(element.data()['variants'])
                    : [],
                colorName: (element.data()['colorName'] != null)
                    ? List<String>.from(element.data()['colorName'])
                    : [],
                colorHex: (element.data()['colorHex'] != null)
                    ? List<String>.from(element.data()['colorHex'])
                    : [],
                specification: (element.data()['specifications'] != null)
                    ? Map<String, dynamic>.from(
                        element.data()['specifications'])
                    : {}));
          });
        }

        print("11 $cartdata");
        while (cartdata == null) {
          print("data not loaded");
        }
        setState(() {
          cartlist = cartdata;
          print(cartlist);
        });
      });
    } catch (e) {
      print(e);
    }
  }

  void deleteProduct(int index) async {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CartPage()));
    await FirebaseFirestore.instance.collection('Users').doc(user).update({
      'cartDetails': FieldValue.arrayRemove([cartDetails[index].cartDetails])
    });
    cartDetails.remove(cartDetails[index]);
    productCount.remove(productCount[index]);
    cartlist.remove(cartlist[index]);
  }

  void updateQuantity(int index) async {
    List<Map<String, dynamic>> cartdatalist = [];
    for (int i = 0; i < cartDetails.length; i++)
      cartdatalist.add(cartDetails[i].cartDetails);
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(user)
        .update({'cartDetails': cartdatalist});
  }

  findTotal(double width) {
    int total = 0;
    for (int i = 0; i < cartlist.length; i++) {
      total = total + (cartlist[i].price * productCount[i]);
    }
    return Text("Pay   ₹$total",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: width * 0.043,
            fontFamily: 'Bold',
            color: Colors.white));
  }

  Widget productCounter(double width, int index) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                if (productCount[index] > 1) {
                  productCount[index]--;
                  cartDetails[index].cartDetails['quantity']--;
                  updateQuantity(index);
                } else {
                  productCount[index] = 1;
                  deleteProduct(index);
                }
                count = 1;
              });
            },
            child: Container(
              width: width * 0.065,
              height: width * 0.065,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: productCount[index] == 1
                      ? Colors.red.withOpacity(0.3)
                      : Colors.black),
              child: Center(
                child: SvgPicture.asset(
                  productCount[index] == 1
                      ? 'assets/icons/trash.svg'
                      : 'assets/icons/minus.svg',
                  color: productCount[index] == 1 ? Colors.red : Colors.white,
                  width: width * 0.035,
                  height: width * 0.035,
                ),
              ),
            ),
          ),
          SizedBox(width: width * 0.008),
          Container(
              child: Text(productCount[index].toString(),
                  style:
                      TextStyle(fontSize: width * 0.06, fontFamily: 'Medium'))),
          SizedBox(width: width * 0.008),
          InkWell(
            onTap: () {
              setState(() {
                productCount[index]++;
                cartDetails[index].cartDetails['quantity']++;
                count = 1;
                updateQuantity(index);
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

  Widget cartProductContainer(Products product, int index, double width) {
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
                  'assets/products/${product.productId}f.png',
                  width: width * 0.2,
                  height: width * 0.2,
                ),
              ),
              SizedBox(width: 20),
              Container(
                height: width * 0.2,
                width: width * 0.385,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${product.category} - ${product.productName}',
                      style: TextStyle(
                        fontFamily: 'Bold',
                        color: Colors.black,
                        fontSize: width * 0.042,
                      ),
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                    ),
                    Text(
                      '₹ ${product.price}',
                      style: TextStyle(
                        fontFamily: 'Medium',
                        color: Colors.black,
                        fontSize: width * 0.039,
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
                  child: productCounter(width, index),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }

  Widget subTotalContainer(
      Products product, int index, double height, double width) {
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
                    '${index + 1}',
                    style: TextStyle(
                      fontFamily: 'Bold',
                      color: Colors.black,
                      fontSize: width * 0.039,
                    ),
                  ),
                ),
              ),
              SizedBox(width: width * 0.02),
              Container(
                width: width * 0.35,
                child: Text('${product.category} - ${product.productName}',
                    style: TextStyle(
                      fontFamily: 'Bold',
                      color: Colors.black,
                      fontSize: width * 0.042,
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
                      fontSize: width * 0.039,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 2),
              ),
              SizedBox(width: width * 0.02),
              Container(
                child: Text('${productCount[index]}',
                    style: TextStyle(
                      fontFamily: 'Bold',
                      color: Colors.black,
                      fontSize: width * 0.04,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 2),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      child: Text(
                    '₹ ${product.price * productCount[index]}',
                    style: TextStyle(
                      fontFamily: 'Bold',
                      color: Colors.black,
                      fontSize: width * 0.042,
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

  Widget body(double width, double height) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
          top: width * 0.035 / 2 + 4,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(height * 0.05),
              topLeft: Radius.circular(height * 0.05)),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: (cartlist.isEmpty)
                  ? Container(
                      width: width,
                      padding: EdgeInsets.symmetric(vertical: height * 0.25),
                      child: Column(children: [
                        Image(
                          image: AssetImage("assets/images/CartEmpty.png"),
                          width: width * 0.4,
                          height: width * 0.4,
                        ),
                        SizedBox(height: height * 0.04),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.15),
                          child: Text(
                            "No products added to cart!",
                            style: TextStyle(
                              fontFamily: 'Bold',
                              fontSize: width * 0.039,
                            ),
                          ),
                        )
                      ]),
                    )
                  : Container(
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
                                  itemCount: cartlist.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return cartProductContainer(
                                        cartlist[index], index, width);
                                  })),
                          SizedBox(height: height * 0.0125),
                          Container(
                            child: Text(
                              'ORDER SUMMARY',
                              style: TextStyle(
                                  fontFamily: 'Medium',
                                  fontSize: width * 0.039,
                                  letterSpacing: width * 0.039 * 0.05),
                            ),
                          ),
                          SizedBox(height: height * 0.0075),
                          Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 15, bottom: 15),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(248, 248, 248, 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(width * 0.05),
                                topRight: Radius.circular(width * 0.05),
                              ),
                            ),
                            child: ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxHeight: 50000000000),
                              child: ListView.builder(
                                  padding: EdgeInsets.all(0),
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: cartlist.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    // for (int i = 0; i < cartlist.length; i++)
                                    //   productCount.add(1);
                                    return subTotalContainer(
                                        cartlist[index], index, height, width);
                                  }),
                            ),
                          ),
                          SizedBox(height: height * 0.108)
                        ],
                      ),
                    ),
            ),
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
                                color: Color.fromRGBO(196, 196, 196, 100)))),
                    child: InkWell(
                      onTap: () {
                        // actionSheet(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentDonePage()));
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
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  child: Container(
                                    height: height * 0.065,
                                    width: width * 0.85,
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
                                    height: height * 0.065,
                                    width: width * 0.85,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [findTotal(width)],
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
    );
  }

  Widget waitTimer(double width, double height) {
    Timer(Duration(seconds: 2), () {
      setState(() {
        data = "done";
      });
    });
    if (data == null)
      return Expanded(
          child: Container(
              padding: EdgeInsets.only(
                top: width * 0.035 / 2 + 4,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(height * 0.05),
                    topLeft: Radius.circular(height * 0.05)),
              ),
              child: Center(
                child: Container(
                    width: 30, height: 30, child: CircularProgressIndicator()),
              )));
    if (data != null)
      setState(() {
        data = null;
      });
    return body(width, height);
  }

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
            SizedBox(height: 20),
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
                                      fontSize: height * 0.027,
                                      fontFamily: 'Bold',
                                      color: Colors.white,
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
                                child: Container(
                                  height: height * 0.055,
                                  width: height * 0.055,
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
            waitTimer(width, height),
          ],
        ),
      ),
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
