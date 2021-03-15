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
     productBackground = generator.dominantColor != null ? generator.dominantColor : PaletteColor(Colors.black, 2);
     HSLColor productHSL = HSLColor.fromColor(productBackground.color);
     light = productHSL.withLightness(0.7);
     dark = productHSL.withLightness(0.3);
     setState(() {});
  }
  Widget build(BuildContext context) {
    return Container(
      //backgroundColor:  productBackground != null ? productBackground.color : Color.fromRGBO(229, 229, 229, 1),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [light != null ? light.toColor() : Color.fromRGBO(229, 229, 229, 1), dark != null ? dark.toColor() : Color.fromRGBO(229, 229, 229, 1)]),
      ),
    );
  }
}
