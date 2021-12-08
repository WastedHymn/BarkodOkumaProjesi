import 'package:get/get.dart';

class ProductPageController extends GetxController {
  var productName = "DummyName".obs;
  var productPrice = 0.0.obs;
  var productDescription = "DummyDescription".obs;
  var productBarcode = "".obs;

  void changeProductInfo({
    required String newProductName,
    required double newProductPrice,
    required String newProductDescription,
    required String newProductBarcode,
  }) {
    productName.value = newProductName;
    productPrice.value = newProductPrice;
    productDescription.value = newProductDescription;
    productBarcode.value = newProductBarcode;
  }

  void changeBarcode({required String newBarcode}) {
    productBarcode.value = newBarcode;

    printInfo(
        info: "PRODUCT BARCODE CHANGED IN PRODUCT PAGE CONTROLLER: " +
            productBarcode.value.toString());
  }
}
