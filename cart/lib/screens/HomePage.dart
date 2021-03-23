import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:palette_generator/palette_generator.dart';

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
  ];
  List<bool> selected = [];
  int count;
  void initState() {
    selected.add(true);
    for (int i = 0; i < categories.length - 1; i++) selected.add(false);
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
                        style: TextStyle(fontFamily: 'Bold', fontSize: 25),
                      ),
                      SizedBox(
                        width: width * 0.3,
                      ),
                      IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () {},
                      )
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      width: width * 0.94,
                      height: 60,
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
                  SizedBox(height: height * 0.02),
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
                                      : Colors.grey[400],
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
                                    Container(
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
                                              stops: [0.0, 0.4],
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40)),
                                        child: Column(
                                          children: [
                                            Center(
                                              child: Image(
                                                  // width: (width * 0.4) * 0.9,
                                                  height: 150,
                                                  image: AssetImage(
                                                      "assets/products/phone.png")),
                                            ),
                                            Container(
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        225, 225, 225, 0.23),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                width: (width * 0.4) * 0.8,
                                                height: 50,
                                                child: Center(
                                                  child: Text(
                                                    "Rs.719",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: 'Medium'),
                                                  ),
                                                ))
                                          ],
                                        )),
                                    SizedBox(width: width * 0.05),
                                    Container(
                                        width: width * 0.4,
                                        height: 200,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                ((index * 2) + 1 <
                                                        categories.length)
                                                    ? light != null
                                                        ? light.toColor()
                                                        : Color.fromRGBO(
                                                            229, 229, 229, 1)
                                                    : Color.fromRGBO(
                                                        229, 229, 229, 1),
                                                ((index * 2) + 1 <
                                                        categories.length)
                                                    ? dark != null
                                                        ? dark.toColor()
                                                        : Color.fromRGBO(
                                                            229, 229, 229, 1)
                                                    : Color.fromRGBO(
                                                        229, 229, 229, 1),
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              stops: [0.0, 0.4],
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40)),
                                        child: Column(
                                          children: [
                                            Center(
                                              child: ((index * 2) + 1 <
                                                      categories.length)
                                                  ? Image(
                                                      height: 150,
                                                      image: AssetImage(
                                                          "assets/products/phone.png"))
                                                  : Container(),
                                            ),
                                            Container(
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        225, 225, 225, 0.23),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                width: (width * 0.4) * 0.8,
                                                height: 50,
                                                child: Center(
                                                  child: Text(
                                                    "Rs.719",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: 'Medium'),
                                                  ),
                                                ))
                                          ],
                                        )),
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
