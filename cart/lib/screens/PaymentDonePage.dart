import 'package:flutter/material.dart';

class PaymentDonePage extends StatefulWidget {
  @override
  _PaymentDonePageState createState() => _PaymentDonePageState();
}

class _PaymentDonePageState extends State<PaymentDonePage> {
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Image(
            height: height * 0.4,
            image: AssetImage("assets/images/PAYMENTDONE.png"),
          ),
        ),
      ),
    );
  }
}
