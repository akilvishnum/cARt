import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cart/screens/HomePage.dart';
import 'package:shimmer/shimmer.dart';
class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>{
  bool loading = true; Widget h;
  @override
  void initState(){
      super.initState();
      Timer timer = Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      });
  }
  Widget build(BuildContext context){
    return ShimmerList();
  }
}
class ShimmerList extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Shimmer.fromColors(
          highlightColor: Colors.grey[100],
          baseColor: Colors.grey[300],
          child: ShimmerLayout(),
        ),
      )
    );
  }
}
class ShimmerLayout extends StatelessWidget{
  Widget build(BuildContext context){
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 26,
              width: width * 0.75,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
            width: width * 0.94,
            height: 50,
        ),
        SizedBox(height: height * 0.02),
        Container(
          child: Container(
            height: 26,
            width: width * 0.40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(height: height * 0.01 + 50),
        Container(
          width: width,
          height: height * 0.68,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width * 0.4,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20)),
                          ),
                          SizedBox(width: width * 0.05),
                          Container(

                            width: width * 0.4,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20)
                  ],
                ),
              );

            },
          ),
        )
      ],
    );
  }
}
