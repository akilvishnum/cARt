import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String productImage = 'assets/products/phone.png';
  PaletteColor productBackground;
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
     setState(() {});
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  productBackground != null ? productBackground.color : Color.fromRGBO(229, 229, 229, 1),
    );
  }
}
