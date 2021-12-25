import 'package:get/get.dart';

class ProductPageController extends GetxController {
  var productName = "DummyName".obs;
  var productPrice = 0.0.obs;
  var productDescription = "DummyDescription".obs;
  var productBarcode = "DummyBarcode".obs;
  var productId = 0.obs;
  var productColor = "DummyColor".obs;
  var availableMarket = "DummyMarket".obs;
  var productMaterial = "DummyMaterial".obs;
  var productComment = "DummyComment".obs;

  var localProductName = "DummyName".obs;
  var localProductPrice = 0.0.obs;
  var localProductDescription = "DummyDescription".obs;
  var localProductBarcode = "DummyBarcode".obs;
  var localProductId = 0.obs;
  var localProductColor = "DummyColor".obs;
  var localAvailableMarket = "DummyMarket".obs;
  var localProductMaterial = "DummyMaterial".obs;
  //var localProductComment = "DummyComment".obs;

  void changeProductInfo({
    required String newProductName,
    required double newProductPrice,
    required String newProductDescription,
    required String newProductBarcode,
    required int newProductId,
    required String newProductColor,
    required String newAvailableMarket,
    required String newProductMaterial,
    required String newProductComment,
  }) {
    productName.value = newProductName;
    productPrice.value = newProductPrice;
    productDescription.value = newProductDescription;
    productBarcode.value = newProductBarcode;
    productId.value = newProductId;
    productColor.value = newProductColor;
    availableMarket.value = newAvailableMarket;
    productMaterial.value = newProductMaterial;
    productComment.value = newProductComment;
  }

  void changeLocalProductInfo({
    required String newProductName,
    required double newProductPrice,
    required String newProductDescription,
    required String newProductBarcode,
    required int newProductId,
    required String newProductColor,
    required String newAvailableMarket,
    required String newProductMaterial,
    //required String newProductComment,
  }) {
    localProductName.value = newProductName;
    localProductPrice.value = newProductPrice;
    localProductDescription.value = newProductDescription;
    localProductBarcode.value = newProductBarcode;
    localProductId.value = newProductId;
    localProductColor.value = newProductColor;
    localAvailableMarket.value = newAvailableMarket;
    localProductMaterial.value = newProductMaterial;
    //localProductComment.value = newProductComment;
  }

  void changeBarcode({required String newBarcode}) {
    productBarcode.value = newBarcode;

    printInfo(
        info: "PRODUCT BARCODE CHANGED IN PRODUCT PAGE CONTROLLER: " +
            productBarcode.value.toString());
  }
}
