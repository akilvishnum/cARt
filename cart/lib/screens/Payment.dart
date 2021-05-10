import 'package:cart/screens/PaymentDonePage.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartPayment extends StatefulWidget {
  int amount;
  CartPayment({this.amount});
  @override
  _CartPaymentState createState() => _CartPaymentState();
}

class _CartPaymentState extends State<CartPayment> {
  final _razorpay = Razorpay();
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    getPayment();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Successfully paid");
    print(response.paymentId.toString());
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PaymentDonePage()));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment Error");
    print(response.message + response.code.toString());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("External Wallet");
    print(response.walletName);
  }

  getPayment() {
    var options = {
      'key': 'rzp_test_UcCYtODWM3OlEQ',
      'amount': widget.amount * 100, //in the smallest currency sub-unit.
      'name': 'Cart', // Generate order_id using Orders API
      'description': 'Shopping with CART',
      'prefill': {
        'contact': '6385490321',
        'email': 'balasubramaniam082000@gmail.com'
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    // return Scaffold(
    //     backgroundColor: Colors.white,
    //     body: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisSize: MainAxisSize.max,
    //       children: [
    //         TextField(
    //           controller: controller,
    //           keyboardType: TextInputType.number,
    //         ),
    //         RaisedButton(
    //           child: Text("Pay"),
    //           onPressed: () {
    //             getPayment();
    //           },
    //         )
    //       ],
    //     ));
  }
}
