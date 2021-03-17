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

  void initState(){
    super.initState();
    _findBackground();
  }

  _findBackground() async{
     final PaletteGenerator generator =
     await PaletteGenerator.fromImageProvider(
       AssetImage(productImage), size: Size(100000, 100000),
     );
     productBackground = generator.dominantColor != null ? generator.dominantColor : PaletteColor(Colors.white, 2);
     HSLColor productHSL = HSLColor.fromColor(productBackground.color);
     light = productHSL.withLightness(0.8);
     dark = productHSL.withLightness(0.4);
     setState(() {});
  }
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      //backgroundColor:  productBackground != null ? productBackground.color : Color.fromRGBO(229, 229, 229, 1),
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [light != null ? light.toColor() : Color.fromRGBO(229, 229, 229, 1), dark != null ? dark.toColor() : Color.fromRGBO(229, 229, 229, 1)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.4],
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: height * 0.35),
          Container(
            height: height * 0.65,
            width: width,
            decoration: BoxDecoration(
              color: Color.fromRGBO(229, 229, 229, 1),
              borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
            ),
          )
        ],
      )
    );
  }
}
