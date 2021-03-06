import 'package:cart/screens/CartPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:cart/screens/productPage.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cart/Component/Products.dart';

final recentList = [];
int resultIndex = -1;
int selectedindex = 0;

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
    "Eye Wear",
    "Sofa",
    "Bag",
    "Instruments",
    "Mask",
    "Laptop",
    "Cap",
    "Shirts",
    "Trousers",
    "HeadPhones",
  ];
  List<List<Products>> products = [[], [], [], [], [], [], [], [], [], [], []];
  // List<List<String>> products = [
  //   ["1", "2", "3", "4", "5"],
  //   ["Chairs1", "Chairs2", "Chairs3"],
  //   ["Sofa1", "sofa2", "sofa3"],
  //   ["Smart phone 1", "smart phone 2", "smart phone 3"],
  //   ["head phones 1", "head phones 2", "head phones 3"],
  //   ["cap 1", "cap 2", "cap3"],
  //   ["glasses 1", "glasses 2", "glasses 3"],
  //   ["shirt 1", "shirt 2", "shirt 3"],
  //   ["pant 1", "pant 2", "pant 3"],
  //   ["shoes 1", "shoes 2", "shoes 3"],
  //   ["watch 1", "watch 2", "watch 3"]
  // ];
  List<bool> selected = [];
  //int selectedindex = 0;
  int count;
  void initState() {
    // if (resultIndex != -1)
    //   setState(() {
    //     searchResultIndex = resultIndex;
    //     resultIndex = -1;
    //   });
    selected.add(true);
    for (int i = 0; i < categories.length; i++) selected.add(false);
    // selected[selectedindex] = true;
    fetchproducts();
  }

  void fetchproducts() async {
    List<List<Products>> prod = [[], [], [], [], [], [], [], [], [], [], []];
    await FirebaseFirestore.instance
        .collection('Products')
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((element) {
        prod[0].add(Products(
            productId: element.data()['productId'],
            productName: element.data()['productName'],
            productType: element.data()['productType'],
            category: element.data()['category'],
            price: element.data()['price'],
            description: element.data()['description'],
            variants: (element.data()['variants'] != null)
                ? List<String>.from(element.data()['variants'])
                : [],
            colorName: (element.data()['colorName'] != null)
                ? List<String>.from(element.data()['colorName'])
                : [],
            colorHex: (element.data()['colorHex'] != null)
                ? List<String>.from(element.data()['colorHex'])
                : [],
            specification: (element.data()['specifications'] != null)
                ? Map<String, dynamic>.from(element.data()['specifications'])
                : {},
            count: 0,
            light: null,
            dark: null));
        if (element.data()['category'] == "Eye Wear")
          prod[1].add(Products(
              productId: element.data()['productId'],
              productName: element.data()['productName'],
              productType: element.data()['productType'],
              category: element.data()['category'],
              price: element.data()['price'],
              description: element.data()['description'],
              variants: (element.data()['variants'] != null)
                  ? List<String>.from(element.data()['variants'])
                  : [],
              colorName: (element.data()['colorName'] != null)
                  ? List<String>.from(element.data()['colorName'])
                  : [],
              colorHex: (element.data()['colorHex'] != null)
                  ? List<String>.from(element.data()['colorHex'])
                  : [],
              specification: (element.data()['specifications'] != null)
                  ? Map<String, dynamic>.from(element.data()['specifications'])
                  : {},
              count: 0,
              light: null,
              dark: null));
        else if (element.data()['category'] == "Sofa")
          prod[2].add(Products(
              productId: element.data()['productId'],
              productName: element.data()['productName'],
              productType: element.data()['productType'],
              category: element.data()['category'],
              price: element.data()['price'],
              description: element.data()['description'],
              variants: (element.data()['variants'] != null)
                  ? List<String>.from(element.data()['variants'])
                  : [],
              colorName: (element.data()['colorName'] != null)
                  ? List<String>.from(element.data()['colorName'])
                  : [],
              colorHex: (element.data()['colorHex'] != null)
                  ? List<String>.from(element.data()['colorHex'])
                  : [],
              specification: (element.data()['specifications'] != null)
                  ? Map<String, dynamic>.from(element.data()['specifications'])
                  : {},
              count: 0,
              light: null,
              dark: null));
        else if (element.data()['category'] == "Bag")
          prod[3].add(Products(
              productId: element.data()['productId'],
              productName: element.data()['productName'],
              productType: element.data()['productType'],
              category: element.data()['category'],
              price: element.data()['price'],
              description: element.data()['description'],
              variants: (element.data()['variants'] != null)
                  ? List<String>.from(element.data()['variants'])
                  : [],
              colorName: (element.data()['colorName'] != null)
                  ? List<String>.from(element.data()['colorName'])
                  : [],
              colorHex: (element.data()['colorHex'] != null)
                  ? List<String>.from(element.data()['colorHex'])
                  : [],
              specification: (element.data()['specifications'] != null)
                  ? Map<String, dynamic>.from(element.data()['specifications'])
                  : {},
              count: 0,
              light: null,
              dark: null));
        else if (element.data()['category'] == "Instruments")
          prod[4].add(Products(
              productId: element.data()['productId'],
              productName: element.data()['productName'],
              productType: element.data()['productType'],
              category: element.data()['category'],
              price: element.data()['price'],
              description: element.data()['description'],
              variants: (element.data()['variants'] != null)
                  ? List<String>.from(element.data()['variants'])
                  : [],
              colorName: (element.data()['colorName'] != null)
                  ? List<String>.from(element.data()['colorName'])
                  : [],
              colorHex: (element.data()['colorHex'] != null)
                  ? List<String>.from(element.data()['colorHex'])
                  : [],
              specification: (element.data()['specifications'] != null)
                  ? Map<String, dynamic>.from(element.data()['specifications'])
                  : {},
              count: 0,
              light: null,
              dark: null));
        else if (element.data()['category'] == "Mask")
          prod[5].add(Products(
              productId: element.data()['productId'],
              productName: element.data()['productName'],
              productType: element.data()['productType'],
              category: element.data()['category'],
              price: element.data()['price'],
              description: element.data()['description'],
              variants: (element.data()['variants'] != null)
                  ? List<String>.from(element.data()['variants'])
                  : [],
              colorName: (element.data()['colorName'] != null)
                  ? List<String>.from(element.data()['colorName'])
                  : [],
              colorHex: (element.data()['colorHex'] != null)
                  ? List<String>.from(element.data()['colorHex'])
                  : [],
              specification: (element.data()['specifications'] != null)
                  ? Map<String, dynamic>.from(element.data()['specifications'])
                  : {},
              count: 0,
              light: null,
              dark: null));
        else if (element.data()['category'] == "Laptop")
          prod[6].add(Products(
              productId: element.data()['productId'],
              productName: element.data()['productName'],
              productType: element.data()['productType'],
              category: element.data()['category'],
              price: element.data()['price'],
              description: element.data()['description'],
              variants: (element.data()['variants'] != null)
                  ? List<String>.from(element.data()['variants'])
                  : [],
              colorName: (element.data()['colorName'] != null)
                  ? List<String>.from(element.data()['colorName'])
                  : [],
              colorHex: (element.data()['colorHex'] != null)
                  ? List<String>.from(element.data()['colorHex'])
                  : [],
              specification: (element.data()['specifications'] != null)
                  ? Map<String, dynamic>.from(element.data()['specifications'])
                  : {},
              count: 0,
              light: null,
              dark: null));
        else if (element.data()['category'] == "Cap")
          prod[7].add(Products(
              productId: element.data()['productId'],
              productName: element.data()['productName'],
              productType: element.data()['productType'],
              category: element.data()['category'],
              price: element.data()['price'],
              description: element.data()['description'],
              variants: (element.data()['variants'] != null)
                  ? List<String>.from(element.data()['variants'])
                  : [],
              colorName: (element.data()['colorName'] != null)
                  ? List<String>.from(element.data()['colorName'])
                  : [],
              colorHex: (element.data()['colorHex'] != null)
                  ? List<String>.from(element.data()['colorHex'])
                  : [],
              specification: (element.data()['specifications'] != null)
                  ? Map<String, dynamic>.from(element.data()['specifications'])
                  : {},
              count: 0,
              light: null,
              dark: null));
        else if (element.data()['category'] == "Shirts")
          prod[8].add(Products(
              productId: element.data()['productId'],
              productName: element.data()['productName'],
              productType: element.data()['productType'],
              category: element.data()['category'],
              price: element.data()['price'],
              description: element.data()['description'],
              variants: (element.data()['variants'] != null)
                  ? List<String>.from(element.data()['variants'])
                  : [],
              colorName: (element.data()['colorName'] != null)
                  ? List<String>.from(element.data()['colorName'])
                  : [],
              colorHex: (element.data()['colorHex'] != null)
                  ? List<String>.from(element.data()['colorHex'])
                  : [],
              specification: (element.data()['specifications'] != null)
                  ? Map<String, dynamic>.from(element.data()['specifications'])
                  : {},
              count: 0,
              light: null,
              dark: null));
        else if (element.data()['category'] == "Trousers")
          prod[9].add(Products(
              productId: element.data()['productId'],
              productName: element.data()['productName'],
              productType: element.data()['productType'],
              category: element.data()['category'],
              price: element.data()['price'],
              description: element.data()['description'],
              variants: (element.data()['variants'] != null)
                  ? List<String>.from(element.data()['variants'])
                  : [],
              colorName: (element.data()['colorName'] != null)
                  ? List<String>.from(element.data()['colorName'])
                  : [],
              colorHex: (element.data()['colorHex'] != null)
                  ? List<String>.from(element.data()['colorHex'])
                  : [],
              specification: (element.data()['specifications'] != null)
                  ? Map<String, dynamic>.from(element.data()['specifications'])
                  : {},
              count: 0,
              light: null,
              dark: null));
        else if (element.data()['category'] == "HeadPhones")
          prod[10].add(Products(
              productId: element.data()['productId'],
              productName: element.data()['productName'],
              productType: element.data()['productType'],
              category: element.data()['category'],
              price: element.data()['price'],
              description: element.data()['description'],
              variants: (element.data()['variants'] != null)
                  ? List<String>.from(element.data()['variants'])
                  : [],
              colorName: (element.data()['colorName'] != null)
                  ? List<String>.from(element.data()['colorName'])
                  : [],
              colorHex: (element.data()['colorHex'] != null)
                  ? List<String>.from(element.data()['colorHex'])
                  : [],
              specification: (element.data()['specifications'] != null)
                  ? Map<String, dynamic>.from(element.data()['specifications'])
                  : {},
              count: 0,
              light: null,
              dark: null));
        print("..........................");
        print(prod);
      });
      setState(() {
        products = prod;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    count = (products[selectedindex].length / 2).round();
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    for (int i = 0; i < categories.length; i++) selected[i] = false;
    selected[selectedindex] = true;
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
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartPage()));
                          },
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
                    child: InkWell(
                      onTap: () {
                        showSearch(context: context, delegate: DataSearch());
                      },
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: width * 0.54,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text("Search",
                                    style: TextStyle(
                                        fontFamily: 'Medium', fontSize: 20))),
                            SizedBox(
                              width: width * 0.25,
                            ),
                            Icon(Icons.search, size: 30)
                          ]),
                    ),
                  ),
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
                                  selectedindex = index;
                                });
                              },
                              child: Container(
                                width: 150,
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
                                    PDisplay(
                                        product: products[selectedindex]
                                            [index * 2]),
                                    SizedBox(width: width * 0.05),
                                    ((index * 2) + 1 <
                                            products[selectedindex].length)
                                        ? PDisplay(
                                            product: products[selectedindex]
                                                [(index * 2) + 1])
                                        : Container(),
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
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
        child: child,
      ),
    );

class PDisplay extends StatefulWidget {
  Products product;
  PDisplay({this.product});
  @override
  _PDisplayState createState() => _PDisplayState();
}

class _PDisplayState extends State<PDisplay> {
  PaletteColor productBackground;
  HSLColor light, dark;
  bool ready = false;
  @override
  void initState() {
    super.initState();
  }

  _findBackground(String productImage) async {
    PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
      AssetImage(productImage),
      size: Size(10000, 10000),
    );
    // if (generator.dominantColor != null) {
    //   setState(() {
    //     ready = true;
    //   });
    // }
    productBackground = generator.dominantColor != null
        ? generator.dominantColor
        : PaletteColor(Colors.white, 2);
    HSLColor productHSL = HSLColor.fromColor(productBackground.color);
    light = productHSL.withLightness(0.8);
    dark = productHSL.withLightness(0.3);
    setState(() {
      widget.product.count = 1;
      widget.product.light = light;
      widget.product.dark = dark;
    });
  }

  Widget build(BuildContext context) {
    if (widget.product.count == 0)
      _findBackground("assets/products/${widget.product.productId}s.png");
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.4,
      height: 200,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              widget.product.light != null
                  ? widget.product.light.toColor()
                  : Color.fromRGBO(229, 229, 229, 1),
              widget.product.dark != null
                  ? widget.product.dark.toColor()
                  : Color.fromRGBO(229, 229, 229, 1)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(40)),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductPage(product: widget.product)));
        },
        child: Stack(
          children: [
            Center(
              child: Image(
                  // width: (width * 0.4) * 0.9,
                  height: 150,
                  image: AssetImage(
                      "assets/products/${widget.product.productId}f.png")),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: buildBlur(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(225, 225, 225, 0.15),
                          Color.fromRGBO(0, 0, 0, 0),
                        ],
                        stops: [0.3, 1],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Color.fromRGBO(196, 196, 196, 100),
                        width: 0.75,
                      ),
                    ),
                    width: (width * 0.4) * 0.8,
                    height: 50,
                    child: Center(
                      child: Text(
                        "${widget.product.price}",
                        //"\$719",
                        style: TextStyle(
                          fontSize: 23,
                          fontFamily: 'Bold',
                        ),
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
    // : Shimmer.fromColors(
    //     highlightColor: Colors.grey[100],
    //     baseColor: Colors.grey[300],
    //     child: Container(
    //       width: width * 0.4,
    //       height: 200,
    //       decoration: BoxDecoration(
    //           color: Colors.grey, borderRadius: BorderRadius.circular(20)),
    //     ),
    //   );
  }
}

class DataSearch extends SearchDelegate<String> {
  final searchList = [
    "All",
    "Eye Wear",
    "Sofa",
    "Bag",
    "Instruments",
    "Mask",
    "Laptop",
    "Cap",
    "Shirts",
    "Trousers",
    "HeadPhones",
  ];

  //List recentList = [];
  // List recentList = ["Shirts", "Pants", "shoes", "Watch"];

  //String result = "";
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
          close(context, null);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  TextStyle get searchFieldStyle => TextStyle(fontFamily: 'Bold');
  @override
  Widget buildSuggestions(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final suggestionList = query.isEmpty
        ? recentList
        : searchList
            .where((element) =>
                element.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return Container(
      width: width,
      height: height,
      color: Color.fromRGBO(229, 229, 229, 1),
      child: ListView.builder(
          itemCount: suggestionList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(height: 2),
                InkWell(
                  onTap: () {
                    print(suggestionList[index]);
                    resultIndex = index;
                    if (!recentList.contains(suggestionList[index])) {
                      recentList.insert(0, suggestionList[index]);
                      if (recentList.length > 5) recentList.removeLast();
                    }
                    selectedindex = searchList.indexOf(suggestionList[index]);
                    print(
                        "Search result:  ${searchList.indexOf(suggestionList[index])}");
                    Navigator.pop(context);
                    //showResults(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(191, 191, 191, 100),
                      border: Border(
                          bottom: BorderSide(
                        color: Color.fromRGBO(196, 196, 196, 100),
                        width: 1,
                      )),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    width: width * 0.99,
                    height: 50,
                    child: RichText(
                      text: TextSpan(
                          text:
                              suggestionList[index].substring(0, query.length),
                          style: TextStyle(
                              fontFamily: 'Medium',
                              color: Colors.black,
                              fontSize: 18),
                          children: [
                            TextSpan(
                                text: suggestionList[index]
                                    .substring(query.length),
                                style: TextStyle(
                                    fontFamily: 'Medium',
                                    color: Colors.grey[700],
                                    fontSize: 18))
                          ]),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
