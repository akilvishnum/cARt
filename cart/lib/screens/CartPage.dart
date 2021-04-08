import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
class CartPage extends StatefulWidget{
  @override
  _CartPageState createState() => _CartPageState();
}
class _CartPageState extends State<CartPage>{
  Widget build(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width, height: height,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Container(
              height: height * 0.12,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Expanded(
                    child: Stack(
                      children:[
                        Center(
                          child: Container(
                            child: Text(
                              'Cart',
                              style: TextStyle(
                                  fontSize: height * 0.03,
                                  fontFamily: 'Bold',
                                  color: Colors.white, letterSpacing: height * 0.03 * 0.01)
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0, top: 0, bottom: 0,
                          child: Center(
                            child: Container(
                              height: height * 0.065,
                              width: height * 0.065,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(90, 90, 90, 100),
                                borderRadius: BorderRadius.circular(height * 0.022),
                              ),
                              child: Center(child:SvgPicture.asset(
                                'assets/icons/back.svg',
                                color: Colors.white,
                              ), ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(height * 0.05),
                      topLeft: Radius.circular(height * 0.05)),
                ),
                child: Stack(
                  children:[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Expanded(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 5000),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                              return CartProductContainer();
                          }),
                        ), ),
                      ],
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
                                                        color:
                                                            Colors.white)),
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
class CartProductContainer extends StatelessWidget {
  Widget build(BuildContext context){
    return Container(
      child: Text('Hello'),
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
