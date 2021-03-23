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
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(248, 248, 248, 1),
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
                                  SizedBox(height: height * 0.006),
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
                          Expanded(
                            child: ConstrainedBox(
                              constraints: BoxConstraints.expand(),
                              child: ListView(
                                padding: EdgeInsets.all(0),
                                children: [
                                  Container(
                                    child: Text(
                                        "5G speed. A14 Bionic, the fastest chip in a smartphone. A new OLED display. Ceramic Shield with four times better drop performance. And Night mode on every camera. iPhone 12 has it all — in two perfect sizes. 5G on iPhone is superfast. So you can download movies on the fly. Stream higher-quality video. Or FaceTime in HD over cellular. ",
                                        style: TextStyle(
                                          fontSize: 16,
                                          height: 17.5 / 12,
                                          fontFamily: 'Light',
                                          color: Colors.black,
                                        )),
                                  ),
                                  SizedBox(height: height * 0.020),
                                  Container(height: 50, child: ColorButton()),
                                  SizedBox(height: height * 0.020),
                                  Container(
                                    child: Text("VARIANTS",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Medium',
                                            color: Colors.black,
                                            letterSpacing: 13 * 0.015)),
                                  ),
                                  SizedBox(height: height * 0.0075),
                                  Container(height: 30, child: VariantButton()),
                                ],
                              ),
                            ),
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

class VariantButton extends StatefulWidget {
  @override
  _VariantButtonState createState() => _VariantButtonState();
}

class _VariantButtonState extends State<VariantButton> {
  List<Variant> v = new List<Variant>();
  @override
  void initState() {
    super.initState();
    v.add(new Variant(true, '4GB + 64GB'));
    v.add(new Variant(false, '8GB + 128GB'));
  }

  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: v.length,
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            onTap: () {
              setState(() {
                v.forEach((element) => element.isSelected = false);
                v[index].isSelected = true;
              });
            },
            child: new VariantContainer(v[index]),
          );
        });
  }
}

class VariantContainer extends StatelessWidget {
  final Variant _item;
  VariantContainer(this._item);
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: _item.isSelected
                ? Color.fromRGBO(255, 255, 255, 100)
                : Color.fromRGBO(231, 231, 231, 100),
            border: Border.all(
              color: Color.fromRGBO(196, 196, 196, 100),
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          child: Text(
            _item.info,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Medium',
            ),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.020),
      ],
    );
  }
}

class Variant {
  bool isSelected;
  final String info;
  Variant(this.isSelected, this.info);
}

class ColorButton extends StatefulWidget {
  @override
  _ColorButtonState createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  List<ObjColor> v = new List<ObjColor>();
  @override
  void initState() {
    super.initState();
    v.add(new ObjColor(true, 255, 80, 80, 100, 'Product Red'));
    v.add(new ObjColor(false, 125, 30, 0, 100, 'Brown'));
  }

  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: v.length,
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            onTap: () {
              setState(() {
                v.forEach((element) => element.isSelected = false);
                v[index].isSelected = true;
              });
            },
            child: new ColorContainer(v[index]),
          );
        });
  }
}

class ColorContainer extends StatelessWidget {
  final ObjColor _item;
  ColorContainer(this._item);
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Column(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(_item.r, _item.g, _item.b, _item.o),
                ),
              ),
              SizedBox(height: 2),
              Container(
                child: Text(
                  _item.info,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Medium',
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.020),
      ],
    );
  }
}

class ObjColor {
  int r, g, b;
  double o;
  bool isSelected;
  final String info;
  ObjColor(this.isSelected, this.r, this.g, this.b, this.o, this.info);
}
