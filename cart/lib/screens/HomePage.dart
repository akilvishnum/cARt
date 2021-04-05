import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:cart/screens/productPage.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double width, height;
  String productImage = 'assets/products/phone.png';
  PaletteColor productBackground;
  HSLColor light, dark;
  List<String> categories = [
    "All",
    "Chairs",
    "Sofa",
    "Smart Phones",
    "Head Phones",
    "Caps",
    "Glasses",
    "Shirts",
    "Pants",
    "shoes",
    "Watch",
  ];
  List<bool> selected = [];
  int count;
  void initState() {
    selected.add(true);
    for (int i = 0; i < categories.length - 1; i++) selected.add(false);
  }

  @override
  Widget build(BuildContext context) {
    count = (categories.length / 2).round();
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    print("count $count");
    return Scaffold(
        backgroundColor: Color.fromRGBO(229, 229, 229, 1),
        body: Container(
          height: height,
          child: SingleChildScrollView(
            child: Container(
              height: height,
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Welcome Back!",
                        style: TextStyle(fontFamily: 'Bold', fontSize: 26),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 26,
                            width: 26,
                            child: SvgPicture.asset(
                              'assets/icons/cart.svg',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(191, 191, 191, 100),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      width: width * 0.94,
                      height: 50,
                      child: Container(
                        child: TextFormField(
                          onChanged: (val) {
                            //email = val;
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          //validator: (agentName) {},
                        ),
                      )),
                  SizedBox(height: height * 0.02),
                  Container(
                    child: Text(
                      "Categories",
                      style: TextStyle(fontFamily: 'Bold', fontSize: 25),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    width: width,
                    height: 50,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Container(
                            child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  for (int i = 0; i < categories.length; i++)
                                    selected[i] = false;
                                  selected[index] = true;
                                });
                                print("Hello ${selected}");
                              },
                              child: Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: (selected[index])
                                      ? Colors.black
                                      : Color.fromRGBO(191, 191, 191, 100),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                child: Center(
                                  child: Text(
                                    categories[index],
                                    style: TextStyle(
                                        fontFamily: 'Bold',
                                        fontSize: 18,
                                        color: (selected[index])
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            )
                          ],
                        ));
                      },
                    ),
                  ),
                  Container(
                    width: width,
                    height: height * 0.68,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: count,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    PDisplay(index),
                                    SizedBox(width: width * 0.05),
                                    ShowProduct(index + 1, categories.length),
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
              ),
            ),
          ),
        ));
  }
}
Widget buildBlur(
        {@required Widget child, double sigmaX = 5, double sigmaY = 5}) =>
    ClipRRect(
      borderRadius:BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
        child: child,
      ),
    );
Widget ShowProduct(int index, int l){
  return ((index * 2) + 1 < l) ? PDisplay(index) : Container();
}
class PDisplay extends StatefulWidget{
  int index;
  PDisplay(this.index);
  @override
  _PDisplayState createState() => _PDisplayState();
}
class _PDisplayState extends State<PDisplay> {
  PaletteColor productBackground;
  HSLColor light, dark;
  List<String> images = ["assets/products/blackIphone.png", "assets/products/phone.png", "assets/products/shoe.png"];
  @override
  void initState(){
    super.initState();
    _findBackground(images[widget.index % 3]);
  }

  _findBackground(String productImage) async {
   final PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
     AssetImage(productImage),
     size: Size(10000, 10000),
   );
   productBackground = generator.dominantColor != null
       ? generator.dominantColor
       : PaletteColor(Colors.white, 2);
   HSLColor productHSL = HSLColor.fromColor(productBackground.color);
   light = productHSL.withLightness(0.8);
   dark = productHSL.withLightness(0.3);
   setState(() {});
 }

  Widget build(BuildContext context){
    var width = MediaQuery.of(context).size.width;
    return Container(
        width: width * 0.4,
        height: 200,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                light != null
                    ? light.toColor()
                    : Color.fromRGBO(
                        229, 229, 229, 1),
                dark != null
                    ? dark.toColor()
                    : Color.fromRGBO(
                        229, 229, 229, 1)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius:
                BorderRadius.circular(40)),
        child: InkWell(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProductPage()));
          },
          child: Stack(
            children:[
              Center(
                child: Image(
                    // width: (width * 0.4) * 0.9,
                    height: 150,
                    image: AssetImage(
                        images[widget.index % 3])),
              ),
              Positioned(
              bottom: 0, left: 0, right: 0,
              child: Center(
              child:buildBlur(
                child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors:[
                          Color.fromRGBO(225, 225, 225, 0.15),
                          Color.fromRGBO(0,0,0,0),
                        ],
                        stops:[0.3, 1],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                        borderRadius:
                            BorderRadius.circular(30),
                            border: Border.all(color: Color.fromRGBO(196, 196, 196, 100), width: 0.7,),
                        ),
                    width: (width * 0.4) * 0.8,
                    height: 50,
                    child: Center(
                      child: Text(
                        "\$719",
                        style: TextStyle(
                            fontSize: 23,
                            fontFamily: 'Bold',),
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
}
