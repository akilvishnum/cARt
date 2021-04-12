class Products {
  String productId;
  String productName;
  String productType;
  String category;
  int price;
  String description;
  List<String> variants;
  List<String> colors;
  Map<String, dynamic> specification;
  Products(
      {this.productId,
      this.productName,
      this.productType,
      this.category,
      this.price,
      this.description,
      this.variants,
      this.colors,
      this.specification});
}
