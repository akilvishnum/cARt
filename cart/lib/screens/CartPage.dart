import 'package:flutter/material.dart';
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
                                color: Color.fromRGBO(220, 220, 220, 100),
                                borderRadius: BorderRadius.circular(height * 0.022),
                              ),
                              child: Center(child:SvgPicture.asset(
                                'assets/icons/leftArrow.svg',
                                color: Colors.black,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
