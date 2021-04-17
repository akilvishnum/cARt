import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'dart:async';
import 'package:cart/screens/HomePage.dart';
class PaymentDonePage extends StatefulWidget {
  @override
  _PaymentDonePageState createState() => _PaymentDonePageState();
}

class _PaymentDonePageState extends State<PaymentDonePage> with SingleTickerProviderStateMixin{
  AnimationController ct;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    ct = AnimationController(
      duration: const Duration(seconds: 2), vsync: this);
    animation = (CurvedAnimation(parent: ct, curve: Curves.easeIn)); //CurvedAnimation(parent: ct, curve: Curves.easeIn);
    ct.forward();
    Timer timer = Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    ct.forward();
    return Scaffold(
      backgroundColor: Color.fromRGBO(0,1,25,100),
      body: FadeTransition(
        opacity: animation,
        child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Image(
            height: height * 0.4,
            image: AssetImage("assets/images/PAYMENTDONE.png"),
          ),
        ),
      ), ),
    );
  }
}
