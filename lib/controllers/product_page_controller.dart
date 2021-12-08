import 'package:get/get.dart';

class ProductPageController extends GetxController {
  var productName = "DummyName".obs;
  var productPrice = 0.0.obs;
  var productDescription = "DummyDescription".obs;
  var productBarcode = 0.obs;

  void changeProductInfo({
    required String newProductName,
    required double newProductPrice,
    required String newProductDescription,
    required int newProductBarcode,
  }) {
    productName.value = newProductName;
    productPrice.value = newProductPrice;
    productDescription.value = newProductDescription;
    productBarcode.value = newProductBarcode;
  }
}
