import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String productImage = 'assets/products/phone.png';
  PaletteColor productBackground;
  HSLColor light, dark;
  @override
  void initState() {
    super.initState();
    _findBackground();
  }

  _findBackground() async {
    final PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
      AssetImage(productImage),
      size: Size(100000, 100000),
    );
    productBackground = generator.dominantColor != null
        ? generator.dominantColor
        : PaletteColor(Colors.white, 2);
    HSLColor productHSL = HSLColor.fromColor(productBackground.color);
    light = productHSL.withLightness(0.8);
    dark = productHSL.withLightness(0.4);
    setState(() {});
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            //backgroundColor:  productBackground != null ? productBackground.color : Color.fromRGBO(229, 229, 229, 1),
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  light != null
                      ? light.toColor()
                      : Color.fromRGBO(229, 229, 229, 1),
                  dark != null
                      ? dark.toColor()
                      : Color.fromRGBO(229, 229, 229, 1)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.4],
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: height * 0.35),
                Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      height: height * 0.65,
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(229, 229, 229, 1),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height * 0.105),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text("SMARTPHONE",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Medium',
                                            color: Colors.black,
                                            letterSpacing: 13 * 0.05)),
                                  ),
                                  SizedBox(height: height * 0.005),
                                  Container(
                                    child: Text("IPhone 11",
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontFamily: 'Bold',
                                            color: Colors.black)),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    child: Text("\$719",
                                        style: TextStyle(
                                            fontSize: 38,
                                            fontFamily: 'Bold',
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.020),
                          Flexible(
                            child: Text(
                                "5G speed. A14 Bionic, the fastest chip in a smartphone. An edge-to-edge OLED display. Ceramic Shield with four times better drop performance. And Night mode on every camera. iPhone 12 has it all — in two perfect sizes. 5G on iPhone is superfast. So you can download movies on the fly. Stream higher-quality video. Or FaceTime in HD over cellular. ",
                                style: TextStyle(
                                  fontSize: 16,
                                  height: 17.5 / 12,
                                  fontFamily: 'Light',
                                  color: Colors.black,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: height * 0.55,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: new Image.asset(
                          productImage,
                          height: height * 0.35,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )));
  }
}
