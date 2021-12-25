class Product {
  final String productName;
  final String productDescription;
  final double productPrice;
  final String productBarcode;
  final int productId;
  final String productColor;
  final String availableMarket;
  final String productMaterial;

  Product({
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productBarcode,
    required this.productId,
    required this.productColor,
    required this.availableMarket,
    required this.productMaterial,
  });

  String get getProductName => productName;
  String get getProductBarcode => productBarcode;
  double get getProductPrice => productPrice;
  int get getProductId => productId;
  String get getProductColor => productColor;
  String get getAvailableMarket => availableMarket;
  String get getProductMaterial => productMaterial;
  String get getProductDescription => productDescription;
}
