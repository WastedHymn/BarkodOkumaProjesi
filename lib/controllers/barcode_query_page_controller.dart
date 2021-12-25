import 'dart:convert';
import 'package:barkod_okuma_projesi/apimodule/api_service.dart';
import 'package:barkod_okuma_projesi/controllers/product_page_controller.dart';
import 'package:barkod_okuma_projesi/helper/dialog_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class BarcodeQueryPageController extends GetxController {
  var scannedBarcode = "".obs;
  var databaseList;
  late List<dynamic> decodedDatabase;

  void getProductNameForQuery(String barcode) async {
    var jsonText = await rootBundle.loadString('assets/products.json');
    decodedDatabase = jsonDecode(jsonText);

    for (int i = 0; i < decodedDatabase.length; i++) {
      String str = decodedDatabase[i]["barcodeNumber"];
      if (str == barcode) {
        debugPrint(
            "[getProductNameForQuery] " + decodedDatabase[i]["productName"]);
        String sName = decodedDatabase[i]["productName"];
        ProductPageController productPageController =
            Get.find<ProductPageController>();
        productPageController.changeLocalProductInfo(
          newProductName: decodedDatabase[i]["productName"],
          newProductPrice: double.parse(decodedDatabase[i]["productPrice"]),
          newProductDescription: decodedDatabase[i]["productDescription"],
          newProductBarcode: decodedDatabase[i]["barcodeNumber"],
          newProductId: int.parse(decodedDatabase[i]["id"]),
          newProductColor: decodedDatabase[i]["productColor"],
          newAvailableMarket: decodedDatabase[i]["availabeMarket"],
          newProductMaterial: decodedDatabase[i]["productMaterial"],
        );

        ApiService.fetchProductByName(sName);
        break;
      }
    }
  }

  void updateScannedBarcode({required String barcode}) {
    scannedBarcode.value = barcode;
  }

  void scanBarcode(String pathIm) async {
    final inputImage = InputImage.fromFilePath(pathIm);

    BarcodeScanner barcodeScanner =
        GoogleMlKit.vision.barcodeScanner([BarcodeFormat.ean8]);

    debugPrint("[SCAN BARCODE FUNCTION] SCANNING IMAGE...");

    List<Barcode> barcode2 = List.empty();
    //final List<Barcode> barcodes =
    DialogHelper.showLoading("Barkod Taranıyor...");
    barcodeScanner.processImage(inputImage).catchError((onError) {
      debugPrint("[SCAN BARCODE FUNCTION] " + onError);
    }).timeout(const Duration(seconds: 30), onTimeout: () async {
      DialogHelper.hideLoading();
      barcodeScanner.close();
      return barcode2;
    }).then((barcodes) {
      ProductPageController productPageController =
          Get.find<ProductPageController>();
      DialogHelper.hideLoading();
      if (barcodes.isEmpty) {
        debugPrint("[SCAN BARCODE FUNCTION] BARCODE NOT FOUND.");
        productPageController.changeBarcode(newBarcode: "null");
        barcodeScanner.close();
        return barcode2;
      } else {
        String scannedBarcode = barcodes.first.value.displayValue.toString();
        getProductNameForQuery(scannedBarcode);
        //productPageController.changeBarcode(newBarcode: scannedBarcode);
        for (Barcode barcode in barcodes) {
          debugPrint("[SCAN BARCODE FUNCTION] SCANNED BARCODE: " +
              barcode.value.displayValue.toString());
        }
        barcodeScanner.close();
        return barcode2;
      }
    });
  }
}
